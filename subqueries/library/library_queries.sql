/* The names and position, in order, of all of the patrons with a hold on "Advanced
   Potion-Making" */

SELECT patrons.name, holds.rank
FROM patrons
JOIN holds
ON patrons.id = holds.id
WHERE holds.isbn IN
  (SELECT isbn
  FROM books
  WHERE title = 'Advanced Potion-Making')
ORDER BY holds.rank;

/* Make a list of all book titles and denote whether or not a copy of that book
   is checked out */

SELECT books.title, COUNT(h.*) AS "holds"
FROM books
LEFT JOIN
  (SELECT isbn
  FROM holds) h
USING (isbn)
GROUP BY(books.title);

/* List of average checked out time by book name in the past month */
SELECT books.title, AVG(t.checked_in_date - t.checked_out_date) AS "avg checkout days"
FROM books
JOIN
  (SELECT isbn, checked_out_date, checked_in_date
  FROM transactions
  WHERE checked_out_date > CURRENT_DATE - INTERVAL '1 month') t
USING (isbn)
GROUP BY(books.title);

/* All books that have not been checked out in the past 5 years */
SELECT isbn, title
FROM books
WHERE isbn NOT IN
  (SELECT isbn
  FROM transactions
  WHERE checked_out_date > CURRENT_DATE - INTERVAL '1 month');

/* All library patrons, and the books they have checked out if any */
SELECT patrons.name, b.title AS "checked_out_book"
FROM patrons
LEFT JOIN
  (SELECT books.title, transactions.patron_id
  FROM books
  JOIN transactions
  USING (isbn)
  WHERE transactions.checked_in_date IS NULL) b
ON b.patron_id = patrons.id
ORDER BY patrons.name;
