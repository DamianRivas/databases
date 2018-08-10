CREATE TABLE wedding (
  first_name varchar(25),
  last_name varchar(25),
  rsvp boolean,
  num_guests int,
  meals numeric(3, 1)
);

ALTER TABLE wedding ADD COLUMN thank_you_card boolean DEFAULT false;

ALTER TABLE wedding DROP COLUMN meals;

ALTER TABLE wedding ADD COLUMN table_number int;

DROP TABLE wedding;
