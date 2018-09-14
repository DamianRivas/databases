/* All students who have taken a particular class */
SELECT students.first_name, students.last_name, classes.subject
FROM classes
JOIN enrollments
USING (class_id)
JOIN students
USING (student_id)
WHERE (classes.subject = 'Orbital Mechanics')
GROUP BY (students.first_name, students,last_name, classes.subject);

/* The number of each grade earned in a particluar class */
SELECT COUNT(enrollments.grade), enrollments.grade, classes.subject
FROM enrollments
JOIN classes
USING (class_id)
WHERE class_id = 1
GROUP BY (classes.subject, enrollments.grade);


/* Class names and the total number of students who have taken each class in the list */
SELECT classes.subject, COUNT(DISTINCT enrollments.student_id)
FROM enrollments
JOIN classes
USING (class_id)
GROUP BY (classes.subject);

/* The class taken by the largest number of students */
SELECT classes.subject, COUNT(DISTINCT enrollments.student_id) AS student_count
FROM enrollments
JOIN classes
USING (class_id)
GROUP BY (classes.subject)
ORDER BY (classes.subject) DESC
LIMIT 1;
