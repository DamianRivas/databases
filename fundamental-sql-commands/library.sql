CREATE TABLE library (
  isbn text,
  title text,
  author text,
  genre text,
  published date,
  num_copies int,
  available_copies int
);

INSERT INTO library VALUES (
  '0345404475',
  'Do Androids Dream of Electric Sheep?',
  'Philip K. Dick',
  'Science Fiction',
  date '1996-05-28',
  10000,
  3300
);

INSERT INTO library VALUES (
  '0553293354',
  'Foundation',
  'Isaac Asimov',
  'Science Fiction',
  date '1991-10-01',
  20000,
  9400
);

INSERT INTO library VALUES (
  '0062301233',
  'Elon Musk: Tesla, SpaceX, and the Quest for a Fantastic Future',
  'Ashlee Vance',
  'Non-Fiction',
  date '2015-05-19',
  25000,
  2000
);

UPDATE library SET available_copies=available_copies-1 WHERE isbn='0062301233';

DELETE FROM library WHERE isbn = '0345404475';
