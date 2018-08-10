CREATE TABLE email (
  id int,
  subject text,
  sender text,
  addtl_recipients text,
  body text,
  date date,
  read boolean,
  chain_id int
);

INSERT INTO email VALUES (
  1,
  'Happy New Year!',
  'friend@gmail.com',
  'otherfriend@gmail.com,stranger@yahoo.com',
  'Hey guys, have a happy new year!',
  date '2018-01-01',
  TRUE,
  3020
);

INSERT INTO email VALUES (
  2,
  'Drinks?',
  'buddy@gmail.com',
  null,
  'Hey man, want to grab a drink this weekend?',
  date '2018-03-21',
  TRUE,
  3194
);

INSERT INTO email VALUES (
  3,
  'WINNER! WINNER!',
  'scam@mail.com',
  null,
  'YOU WON 1000000 DOLLARS! CLICK HERE TO CLAIM YOUR PRIZE!',
  date '2018-08-04',
  FALSE,
  3657
);

DELETE FROM email WHERE id=3;

UPDATE email SET read = FALSE WHERE id = 2;
