
-- Clean start (safe order: child first, then parent)
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- 1. Create departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,      -- 2. PRIMARY KEY
    department_name VARCHAR(50) NOT NULL,
    location VARCHAR(50)
);

-- 3. Create employees table with department_id
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2),
    department_id INT,

    -- 4. FOREIGN KEY with ON DELETE CASCADE
    CONSTRAINT fk_department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
        ON DELETE CASCADE
);

-- 5. Insert valid records into departments
INSERT INTO departments VALUES
(1, 'IT', 'Chennai'),
(2, 'HR', 'Bangalore'),
(3, 'Finance', 'Mumbai');

-- Insert valid employee records (successful inserts)
INSERT INTO employees VALUES
(101, 'Arun', 50000, 1),
(102, 'Divya', 42000, 2),
(103, 'Karthik', 60000, 1),
(104, 'Meena', 70000, 3);

-- Validate data BEFORE delete
SELECT * FROM departments;
SELECT * FROM employees;

-- 6. Attempt INVALID foreign key insert (will FAIL)
-- Uncomment to test error
-- INSERT INTO employees VALUES (105, 'Ravi', 45000, 99);
-- ERROR: Cannot add or update a child row (foreign key constraint fails)

-- 7. ON DELETE CASCADE demonstration
-- Deleting IT department (department_id = 1)
DELETE FROM departments WHERE department_id = 1;

-- Validate data AFTER cascade delete
SELECT * FROM departments;
SELECT * FROM employees;
