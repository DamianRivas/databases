/* All volunteers. If the volunteer is fostering a dog, include each dog as well */

SELECT v.first_name, v.last_name, d.name AS "dog"
FROM volunteers AS v
LEFT JOIN
  (SELECT id, name FROM dogs) d
ON d.id = v.foster_dog_id;

/* The cat's name, adopter's name, and adopted date for each cat adopted within the
   the past month */

