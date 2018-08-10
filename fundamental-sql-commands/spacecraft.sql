CREATE TABLE spacecraft(
  id int,
  name text,
  year_launched NUMERIC(4),
  country text,
  mission_desc text,
  orbiting text,
  operational boolean,
  earth_distance bigint
);

INSERT INTO spacecraft VALUES (
  1,
  'Voyager 1',
  1977,
  'United States',
  'Fly by and study Jupiter, Saturn, and Titan',
  null,
  TRUE,
  13253000000
);

INSERT INTO spacecraft VALUES (
  2,
  'Juno',
  2011,
  'United States',
  'Scientific investigation of Jupiter',
  'Jupiter',
  TRUE,
  365300000
);

INSERT INTO spacecraft VALUES (
  3,
  'Cassini',
  1997,
  'United States',
  'Scientific investigation of Saturn',
  'Saturn',
  FALSE,
  746000000
);

DELETE FROM spacecraft WHERE id = 3;

UPDATE spacecraft SET operational=FALSE WHERE id = 2;
