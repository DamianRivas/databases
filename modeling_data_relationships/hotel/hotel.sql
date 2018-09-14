DROP TABLE IF EXISTS guests CASCADE;
DROP TABLE IF EXISTS rooms CASCADE;
DROP TABLE IF EXISTS bookings;

CREATE TABLE guests (
  "id"   INTEGER,
  "first_name" VARCHAR(32),
  "last_name" VARCHAR(32),
  "phone" VARCHAR(16),
  "email" varchar(48),
  "address" VARCHAR(64),

  PRIMARY KEY ("id")
);

CREATE TABLE rooms (
  "id"     INTEGER,
  "room_number"   INTEGER,
  "floor_number"  SMALLINT,
  "price"   DECIMAL(13,4),

  PRIMARY KEY ("id")
);

CREATE TABLE bookings (
  "id"    INTEGER,
  "check_in_date" DATE,
  "check_out_date" DATE,

  "guest_id" INTEGER,
  "room_id" INTEGER,

  FOREIGN KEY ("guest_id")
    REFERENCES "guests" ("id")
    ON DELETE CASCADE,

  FOREIGN KEY ("room_id")
    REFERENCES "rooms" ("id")
    ON DELETE CASCADE,

  PRIMARY KEY ("id")
);

INSERT INTO guests
  ("id", "first_name", "last_name", "phone", "email", "address")
VALUES
  (1, 'Rick', 'Deckard', '123-456-789', 'deckard@gmail.com', '123 Replicant Street'),
  (2, 'John', 'Shepard', '323-232-3232', 'shephard@gmail.com', '456 Normandy Blvd'),
  (3, 'Jon', 'Snow', '343-434-3434', 'iknownothing@gmail.com', '1 Winterfell Pl'),
  (4, 'Emhyr', 'var Emreis', '345-234-2345', 'king@gmail.com', '1 Nilgaard Pl');

INSERT INTO rooms
  ("id", "room_number", "floor_number", "price")
VALUES
  (1,     1,              1,              99.99),
  (2,     2,              1,              99.99),
  (3,     3,              1,              74.99),
  (4,     1,              2,              99.99),
  (5,     2,              2,              149.99),
  (6,     1,              3,              249.99);


INSERT INTO bookings
  ("id", "check_in_date",                   "check_out_date",                   "guest_id", "room_id")
VALUES
  (1,     CURRENT_DATE - INTERVAL '30 DAYS', CURRENT_DATE - INTERVAL '23 DAYS',  3,          6),
  (2,     CURRENT_DATE - INTERVAL '30 DAYS', CURRENT_DATE - INTERVAL '23 DAYS',  3,          5),
  (3,     CURRENT_DATE - INTERVAL '20 DAYS', CURRENT_DATE - INTERVAL '18 DAYS',  1,          3),
  (4,     CURRENT_DATE - INTERVAL '13 DAYS', CURRENT_DATE - INTERVAL '12 DAYS',  1,          3),
  (5,     CURRENT_DATE - INTERVAL '8 DAYS',  CURRENT_DATE - INTERVAL '5 DAYS',   1,          3),
  (6,     CURRENT_DATE - INTERVAL '8 DAYS',  CURRENT_DATE - INTERVAL '1 DAYS',   4,          6);
