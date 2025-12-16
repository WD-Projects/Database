-- Active: 1765893405427@@127.0.0.1@3306@school_db
CREATE DATABASE school_DB;
SHOW DATABASES;
SHOW TABLES;
CREATE TABLE students(
    student_id INT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT,
    grade_level INT
);
DROP TABLE students;
INSERT INTO students (student_id, first_name, last_name, age, grade_level)
VALUES
    (101, 'Ayaan', 'Rahman', 14, 4),
    (102, 'Nabila', 'Hasan', 15, 9),
    (103, 'Sumi', 'Ahmed', 13, 7),
    (104, 'Sumi', 'Akter', 16, 10),
    (105, 'Tanvir', 'Hossain', 14, 8);
SELECT * FROM students;
SELECT
    student_id,
    first_name,
    last_name
FROM students;
--WHERE
SELECT * FROM students
WHERE first_name = 'Sumi' OR age = 14;
--LIMIT
SELECT * FROM students
WHERE age > 14
LIMIT 1;
--IN
SELECT * FROM students
WHERE first_name IN ('Sumi');
--NOT IN
SELECT * FROM students
WHERE first_name NOT IN ('Sumi');
--Aggregate Function
SELECT COUNT(*) FROM students;
SELECT SUM(student_id) FROM students;
SELECT COUNT(student_id) FROM students;
SELECT MIN(student_id) FROM students;
SELECT MAX(student_id) FROM students;
SELECT AVG(student_id) FROM students;