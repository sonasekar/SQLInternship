
-- Step 1: Create a new database
CREATE DATABASE intern_training_db;

-- Step 2: Use the database
USE intern_training_db;

-- Step 3: Create students table
CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT
);

-- Step 4: Insert student records
INSERT INTO students (name, email, age) VALUES
('Arun Kumar', 'arun.kumar@gmail.com', 20),
('Priya Sharma', 'priya.sharma@gmail.com', 21),
('Rahul Verma', 'rahul.verma@gmail.com', 22),
('Sneha Iyer', 'sneha.iyer@gmail.com', 20),
('Karthik R', 'karthik.r@gmail.com', 23);

-- Step 5: Retrieve all records
SELECT * FROM students;

-- Step 6: Retrieve specific columns
SELECT name, email FROM students;

-- Step 7: Filter records using WHERE
SELECT * FROM students
WHERE age > 21;

-- Step 8: Order results
SELECT * FROM students
ORDER BY age ASC;

-- Step 9: Count total students
SELECT COUNT(*) AS total_students
FROM students;
