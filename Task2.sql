-- =========================================
-- TASK 2: TABLE REDESIGN & CONSTRAINTS
-- =========================================

-- Use existing database
USE intern_training_db;

-- -------------------------------------------------
-- 1. Redesign students table with proper data types
-- -------------------------------------------------

DROP TABLE IF EXISTS students;

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    date_of_birth DATE NOT NULL,
    age INT CHECK (age >= 0)
);

-- -------------------------------------------------
-- 2. Explanation of Constraints (Documentation)
-- -------------------------------------------------
-- PRIMARY KEY:
-- Ensures each student record is uniquely identifiable.
--
-- NOT NULL:
-- Prevents missing important data like name, email, DOB.
--
-- UNIQUE:
-- Avoids duplicate email IDs for students.
--
-- CHECK:
-- Ensures age is not negative.

-- -------------------------------------------------
-- 3. Insert valid data
-- -------------------------------------------------

INSERT INTO students (full_name, email, date_of_birth, age) VALUES
('Arun Kumar', 'arun.kumar@gmail.com', '2004-06-15', 20),
('Priya Sharma', 'priya.sharma@gmail.com', '2003-08-22', 21),
('Rahul Verma', 'rahul.verma@gmail.com', '2002-01-10', 22);

-- View inserted data
SELECT * FROM students;

-- -------------------------------------------------
-- 4. Try inserting INVALID data (Constraint Failures)
-- -------------------------------------------------

-- ❌ Duplicate email (UNIQUE constraint violation)
-- INSERT INTO students (full_name, email, date_of_birth, age)
-- VALUES ('Test User', 'arun.kumar@gmail.com', '2000-01-01', 25);

-- ❌ NULL name (NOT NULL constraint violation)
-- INSERT INTO students (full_name, email, date_of_birth, age)
-- VALUES (NULL, 'null.name@gmail.com', '2001-05-05', 23);

-- ❌ Negative age (CHECK constraint violation)
-- INSERT INTO students (full_name, email, date_of_birth, age)
-- VALUES ('Invalid Age', 'invalid.age@gmail.com', '2001-01-01', -5);

-- -------------------------------------------------
-- 5. ALTER TABLE: Add new column
-- -------------------------------------------------

ALTER TABLE students
ADD COLUMN phone_number VARCHAR(15);

-- -------------------------------------------------
-- 6. Rename a column
-- -------------------------------------------------

ALTER TABLE students
RENAME COLUMN full_name TO student_name;

-- -------------------------------------------------
-- 7. Drop a column (carefully)
-- -------------------------------------------------

-- Dropping phone_number column
ALTER TABLE students
DROP COLUMN phone_number;

-- -------------------------------------------------
-- 8. Final table structure check
-- -------------------------------------------------

DESCRIBE students;

SELECT * FROM students;
