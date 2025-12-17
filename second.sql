-- Active: 1765893405427@@127.0.0.1@3306@ostad
CREATE DATABASE ostad;
SHOW DATABASES;
SHOW TABLES;
CREATE TABLE students(
    student_id INT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    date_of_birth DATE,
    enrollment_date DATE,
    gpa DECIMAL(3,2),
    is_active BOOLEAN,
    course_id INT
);
--PRIMARY KEY CANNOT BE NULL
--IT MUST BE UNIQUE
--WITH PRIMARY KEY WE CAN IDENTIFY A FULL ROW UNIQUELY
CREATE TABLE courses(
    course_id INT PRIMARY KEY,
    course_name VARCHAR(20),
    instructor VARCHAR(50),
    credits INT,
    department VARCHAR(20)
);
INSERT INTO students
(student_id, first_name, last_name, date_of_birth, enrollment_date, gpa, is_active, course_id)
VALUES
    (1, 'Arif', 'Rahman', '2006-05-14', '2023-01-10', 3.45, TRUE, 121),
    (2, 'Nabila', 'Hasan', '2005-11-22', '2023-01-10', 3.80, TRUE, 265),
    (3, 'Rafi', 'Ahmed', '2006-02-08', '2023-01-12', 3.10, TRUE, 121),
    (4, 'Sumi', 'Akter', '2005-09-30', '2023-01-15', 3.65, TRUE, 342),
    (5, 'Tanvir', 'Hossain', '2006-07-19', '2023-01-18', 2.95, FALSE, 478),
    (6, 'Farhan', 'Khan', '2005-03-11', '2023-01-20', 3.25, TRUE, 265),
    (7, 'Mim', 'Sultana', '2006-12-01', '2023-01-22', 3.90, TRUE, 589),
    (8, 'Sakib', 'Ali', '2005-08-16', '2023-01-25', 2.80, TRUE, 342),
    (9, 'Nusrat', 'Jahan', '2006-01-27', '2023-01-28', 3.55, TRUE, 478),
    (10, 'Arif', 'Mahmud', '2005-06-05', '2023-02-01', 3.00, FALSE, 121);
INSERT INTO courses (course_id, course_name, instructor, credits, department)
VALUES
    (121, 'Database', 'Dr. Rahman', 3, 'CSE'),
    (265, 'Networking', 'Dr. Karim', 4, 'CSE'),
    (342, 'Maths', 'Dr. Islam', 3, 'Math'),
    (478, 'Physics', 'Dr. Chowdhury', 4, 'Science'),
    (589, 'AI', 'Dr. Ahmed', 3, 'CSE');
DROP TABLE students;
DROP TABLE courses;
SELECT * FROM students;
SELECT * FROM courses;
--Order by
SELECT
    student_id,
    first_name,
    last_name,
    gpa
FROM students
ORDER BY gpa;
--GETTING TOP THREE STUDENTS
SELECT
    student_id,
    first_name,
    last_name,
    gpa
FROM students
ORDER BY gpa DESC
LIMIT 3;
SELECT
    student_id,
    first_name,
    last_name,
    gpa
FROM students
ORDER BY first_name ASC, last_name DESC;
--Like
SELECT
    student_id,
    first_name,
    last_name,
    gpa
FROM students
WHERE first_name LIKE 'A%';
SELECT
    student_id,
    first_name,
    last_name,
    gpa
FROM students
WHERE last_name LIKE '%n';
SELECT
    student_id,
    first_name,
    last_name,
    gpa
FROM students
WHERE first_name LIKE '%A%';
SELECT
    student_id,
    first_name,
    last_name,
    gpa
FROM students
WHERE first_name LIKE 'A___';
SELECT COUNT(*) FROM students
WHERE gpa > 3.5;
SELECT AVG(gpa) FROM students
WHERE gpa > 3.5;
--Grouping
SELECT 
    course_id, 
    AVG(gpa),
    COUNT(*)
FROM students
GROUP BY course_id
HAVING COUNT(*) > 1;
--join
SELECT * FROM courses;
SELECT 
    s.student_id,
    s.first_name,
    s.last_name,
    c.course_name
FROM students s
LEFT JOIN courses c
ON s.course_id = c.course_id;
SELECT 
    c.course_name,
    s.student_id,
    s.first_name,
    s.last_name
FROM students s
RIGHT JOIN courses c
ON s.course_id = c.course_id;
SELECT 
    s.student_id,
    s.first_name,
    s.last_name,
    c.course_name
FROM students s
INNER JOIN courses c
ON s.course_id = c.course_id;
SELECT 
    s.student_id,
    s.first_name,
    s.last_name,
    c.course_name
FROM students s
LEFT JOIN courses c
ON s.course_id = c.course_id
UNION
SELECT 
    s.student_id,
    s.first_name,
    s.last_name,
    c.course_name
FROM students s
RIGHT JOIN courses c
ON s.course_id = c.course_id;