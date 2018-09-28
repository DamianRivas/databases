/* All volunteers. If the volunteer is fostering a dog, include each dog as well */

SELECT v.first_name, v.last_name, d.name AS "dog"
FROM volunteers AS v
LEFT JOIN
  (SELECT id, name FROM dogs) d
ON d.id = v.foster_dog_id;

/* The cat's name, adopter's name, and adopted date for each cat adopted within the
   the past month */

SELECT cats.name AS "cat_name", a.first_name, ca.date
FROM cats
JOIN
  (SELECT date, cat_id, adopter_id
  FROM cat_adoptions
  WHERE date > CURRENT_DATE - INTERVAL '1 month') ca
ON cats.id = ca.cat_id
JOIN
  (SELECT first_name, id
  FROM adopters) a
ON ca.adopter_id = a.id;

/* Adopters who have not yet chosen a dog to adopt and all possible combinations
   of adopters and available dogs */
SELECT adopters.first_name AS "adopter_name", dogs.name AS "dog_name"
FROM adopters
CROSS JOIN dogs
WHERE adopters.id NOT IN
  (SELECT adopter_id
  FROM dog_adoptions)
AND dogs.id NOT IN
  (SELECT dog_id
  FROM dog_adoptions)
ORDER BY adopters.first_name;

/* Lists of all cats and all dogs who have not been adopted */
SELECT id, name, gender, age
FROM dogs
WHERE id NOT IN
  (SELECT dog_id
  FROM dog_adoptions);

SELECT id, name, gender, age
FROM cats
WHERE id NOT IN
  (SELECT cat_id
  FROM cat_adoptions);

/* The name of the person who adopted Rosco */
SELECT first_name, last_name
FROM adopters
WHERE id IN
  (SELECT adopter_id
  FROM dog_adoptions
  JOIN dogs
  ON dog_adoptions.dog_id = dogs.id
  WHERE dogs.name = 'Rosco');
