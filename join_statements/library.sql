CREATE TABLE books (
  "isbn"   VARCHAR(16),
  "title"  VARCHAR(64),
  "author" VARCHAR(32),

  PRIMARY KEY ("isbn")
);

CREATE TABLE patrons (
  "id"   INTEGER,
  "name" VARCHAR(32),

  PRIMARY KEY ("id")
);

CREATE TABLE transactions (
  "id"               INTEGER,
  "patron_id"        INTEGER,
  "isbn"             VARCHAR(16),
  "checked_out_date" DATE,
  "checked_in_date"  DATE,

  FOREIGN KEY ("patron_id")
    REFERENCES "patrons" ("id")
    ON DELETE CASCADE,

  FOREIGN KEY ("isbn")
    REFERENCES "books" ("isbn")
    ON DELETE CASCADE,

  PRIMARY KEY ("id")
);

CREATE TABLE holds (
  "id"        INTEGER,
  "patron_id" INTEGER,
  "isbn"      VARCHAR(16),
  "rank"      INTEGER,
  "date"      DATE,

  FOREIGN KEY ("patron_id")
    REFERENCES "patrons" ("id")
    ON DELETE CASCADE,

  FOREIGN KEY ("isbn")
    REFERENCES "books" ("isbn")
    ON DELETE CASCADE,

  PRIMARY KEY ("id")
);

INSERT INTO books
  ("isbn",        "title",                                  "author")
VALUES
  ('1840918626', 'Hogwarts: A History',                     'Bathilda Bagshot'),
  ('3458400871', 'Fantastic Beasts and Where to Find Them', 'Newt Scamander'),
  ('9136884926', 'Advanced Potion-Making',                  'Libatius Borage');

INSERT INTO patrons
  ("id", "name")
VALUES
  ( 1,   'Hermione Granger'),
  ( 2,   'Terry Boot'),
  ( 3,   'Padma Patil'),
  ( 4,   'Cho Chang'),
  ( 5,   'Cedric Diggory');

INSERT INTO transactions
  ("id", "patron_id", "isbn",       "checked_out_date",                        "checked_in_date")
VALUES
 ( 1,     1,          '1840918626',  CURRENT_DATE - INTERVAL '6 YEARS, 1 DAY',  CURRENT_DATE - INTERVAL '6 YEARS'),
 ( 2,     4,          '9136884926',  CURRENT_DATE - INTERVAL '6 YEARS, 1 DAY',  CURRENT_DATE - INTERVAL '6 YEARS'),
 ( 3,     2,          '3458400871',  CURRENT_DATE - INTERVAL '6 YEARS, 1 DAY',  CURRENT_DATE - INTERVAL '6 YEARS'),
 ( 4,     3,          '3458400871',  CURRENT_DATE - INTERVAL '7 DAYS',          CURRENT_DATE - INTERVAL '4 DAYS'),
 ( 5,     2,          '9136884926',  CURRENT_DATE - INTERVAL '3 DAYS',          NULL),
 ( 6,     1,          '3458400871',  CURRENT_DATE - INTERVAL '3 DAYS',          CURRENT_DATE - INTERVAL '1 DAY'),
 ( 7,     5,          '3458400871',  CURRENT_DATE - INTERVAL '1 DAY',           NULL);

INSERT INTO holds
  ("id", "patron_id", "isbn",       "rank", "date")
VALUES
  ( 1,    4,          '3458400871',  1,     CURRENT_DATE - INTERVAL '1 DAY'),
  ( 2,    5,          '9136884926',  2,     CURRENT_DATE - INTERVAL '1 DAYS'),
  ( 3,    2,          '9136884926',  1,     CURRENT_DATE - INTERVAL '2 DAYS');
