DROP TABLE IF EXISTS students CASCADE;
DROP TABLE IF EXISTS classes CASCADE;
DROP TABLE IF EXISTS enrollments;

CREATE TABLE students (
  "student_id"   INTEGER,
  "first_name" VARCHAR(32),
  "last_name" VARCHAR(32),
  "phone" VARCHAR(16),
  "email" varchar(48),
  "address" VARCHAR(64),

  PRIMARY KEY ("student_id")
);

CREATE TABLE classes (
  "class_id"     INTEGER,
  "room_number"   VARCHAR(8),
  "building"  VARCHAR(32),
  "subject"   VARCHAR(32),

  PRIMARY KEY ("class_id")
);

CREATE TABLE enrollments (
  "id"    INTEGER,
  "grade" VARCHAR(1),
  "term" VARCHAR(12),

  "student_id" INTEGER,
  "class_id" INTEGER,

  FOREIGN KEY ("student_id")
    REFERENCES "students" ("student_id")
    ON DELETE CASCADE,

  FOREIGN KEY ("class_id")
    REFERENCES "classes" ("class_id")
    ON DELETE CASCADE,

  PRIMARY KEY ("id")
);

INSERT INTO students
  ("student_id", "first_name", "last_name", "phone", "email", "address")
VALUES
  (1, 'Damian', 'Rivas', '323-123-1234', 'damian@gmail.com', '123 Exotic Ln'),
  (2, 'Ralph', 'Emerson', '123-434-5678', 'emerson@gmail.com', '123 Massachussets St'),
  (3, 'Elon', 'Musk', '235-123-4567', 'boss@spacex.com', '456 Hawthorne Blvd'),
  (4, 'Buzz', 'Aldrin', '999-999-9999', 'buzz@nasa.gov', '1 Moon Ave');

INSERT INTO classes
  ("class_id", "room_number", "building", "subject")
VALUES
  (1, '1A', 'Math and Science', 'Orbital Mechanics'),
  (2, '32', 'Liberal Arts', 'English 1H'),
  (3, '12', 'Math and Science', 'Engineering 101');

INSERT INTO enrollments
  ("id", "grade", "term", "student_id", "class_id")
VALUES
  (1, 'A', 'spring', 1, 1),
  (2, 'A', 'fall', 4, 1),
  (3, 'B', 'fall', 1, 2),
  (4, 'C', 'fall', 3, 2),
  (5, 'A', 'spring', 3, 3),
  (6, 'F', 'fall', 2, 1),
  (7, 'C', 'spring', 2, 1);


