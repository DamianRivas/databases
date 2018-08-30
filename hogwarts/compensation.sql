CREATE TABLE compensation (
  id integer,
  professor_id integer,
  salary integer,
  vacation_days integer
);

COPY compensation FROM '/home/damian/projects/bloc/databases/hogwarts/hogwarts-compensation.csv' DELIMITER ',' CSV;

SELECT SUM(salary) FROM compensation;
SELECT MAX(salary) FROM compensation;
SELECT MIN(vacation_days) FROM compensation;
SELECT AVG(salary) FROM compensation;
SELECT COUNT(professor_id) FROM compensation;

SELECT COUNT(DISTINCT vacation_days) FROM compensation;
