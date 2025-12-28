-- Active: 1765893405427@@127.0.0.1@3306@varsity
SHOW TABLES;
CREATE Table students(
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL UNIQUE,
    full_name VARCHAR(50) NOT NULL,
    age INT CHECK(age >= 10 AND age <= 25),
    enrollment_date DATE DEFAULT(CURRENT_DATE),
    status VARCHAR(20) DEFAULT 'enrolled'
);
INSERT INTO students(email, full_name, age)
VALUES
('a1@gmail.com', 'a1', 20),
('a2@gmail.com', 'a2', 25),
('a3@gmail.com', 'a3', 19);
SELECT * FROM students;
DROP TABLE students;
CREATE TABLE courses(
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_code VARCHAR(20) UNIQUE,
    course_name VARCHAR(50) NOT NULL UNIQUE,
    credit INT DEFAULT 3 CHECK(credit > 0),
    max_students INT DEFAULT 30 CHECK(max_students BETWEEN 10 AND 100)
);
INSERT INTO courses (course_code, course_name, credit, max_students)
VALUES
('CSE101', 'Introduction to Programming', 3, 40),
('CSE102', 'Data Structures', 3, 35),
('CSE201', 'Database Management Systems', 4, 45),
('CSE202', 'Operating Systems', 4, 50),
('CSE301', 'Software Engineering', 3, 30);
SELECT * FROM courses;
CREATE TABLE enrollments(
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    FOREIGN KEY(student_id) REFERENCES students(student_id),
    FOREIGN KEY(course_id) REFERENCES courses(course_id)
);
INSERT INTO enrollments(student_id, course_id)
VALUES
(1, 2);
SELECT * FROM enrollments;
SELECT AVG(age) FROM students;
--SUBQUERY
SELECT * FROM students
WHERE age > (SELECT AVG(age) FROM students);
--CTE(Common Table Expression)
SELECT * FROM students;
WITH mytable AS(
    SELECT age, COUNT(*)
    FROM students
    GROUP BY age
)
SELECT COUNT(*) FROM mytable;
