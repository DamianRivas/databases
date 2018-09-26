CREATE TABLE airplanes (
  "model"         VARCHAR(16),
  "seat_capacity" INTEGER,
  "range"         INTEGER,

  PRIMARY KEY ("model")
);

CREATE TABLE flights (
  "flight_number"  INTEGER,
  "origin"         VARCHAR(32),
  "destination"    VARCHAR(32),
  "company"        VARCHAR(32),
  "distance"       INTEGER,
  "flight_time"    INTEGER,
  "airplane_model" VARCHAR(16),

  PRIMARY KEY ("flight_number"),

  FOREIGN KEY ("airplane_model")
    REFERENCES "airplanes" ("model")
    ON DELETE CASCADE
);

CREATE TABLE transactions (
  "id"             INTEGER,
  "seats_sold"     INTEGER,
  "total_revenue"  DECIMAL(19,4),
  "total_cost"     DECIMAL(19,4),
  "flight_number"  INTEGER,
  "date" DATE,

  PRIMARY KEY ("id"),

  FOREIGN KEY ("flight_number")
    REFERENCES "flights" ("flight_number")
    ON DELETE CASCADE
);

INSERT INTO airplanes
  ("model",       "seat_capacity", "range")
VALUES
  ( 'Boeing 777',  400,             8700 ),
  ( 'Boeing 787',  330,             7635 ),
  ( 'Airbus A330', 287,             7500 ),
  ( 'Airbus A350', 366,             8245 ),
  ( 'Airbus A380', 544,             8200 );

INSERT INTO flights
  ("flight_number", "origin", "destination", "company",          "distance", "flight_time", "airplane_model")
VALUES
  ( 215,            'LAX',    'GRU',         'American Airlines', 6156,      725,           'Boeing 787'  ),
  ( 137,            'LHR',    'JFK',         'Virgin Atlantic',   3451,      435,           'Airbus A330' ),
  ( 8932,           'SFO',    'HKG',         'American Airlines', 6927,      920,           'Boeing 777'  ),
  ( 7352,           'SIN',    'MAN',         'Virgin Atlantic',   6810,      854,           'Airbus A350' ),
  ( 7403,           'MEL',    'SIN',         'British Airways',   3743,      494,           'Airbus A330' ),
  ( 57,             'LHR',    'JNB',         'British Airways',   5620,      640,           'Airbus A380' );

INSERT INTO transactions
  ("id", "seats_sold", "total_revenue", "total_cost", "flight_number", "date")
VALUES
  ( 1,   280, 224382.53, 165948.25, 215, CURRENT_DATE - INTERVAL '27 DAYS'),
  ( 2,   287, 155928.98, 112485.64, 137, CURRENT_DATE - INTERVAL '5 DAYS'),
  ( 3,   380, 288909.19, 261092.22, 8932, CURRENT_DATE - INTERVAL '12 DAYS'),
  ( 4,   310, 250394.70, 241129.99, 7352, CURRENT_DATE - INTERVAL '35 DAYS'),
  ( 5,   210, 131992.12, 130033.14, 7403, CURRENT_DATE - INTERVAL '2 DAYS'),
  ( 6,   490, 342981.54, 251112.86, 57, CURRENT_DATE - INTERVAL '20 DAYS');