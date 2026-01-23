-- 1. Create employees table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    status VARCHAR(15),
    joining_date DATE
);

-- 2. Insert bulk data
INSERT INTO employees (emp_name, department, salary, status, joining_date) VALUES
('Arun', 'IT', 45000, 'Active', '2023-01-10'),
('Divya', 'HR', 38000, 'Active', '2022-07-18'),
('Karthik', 'IT', 52000, 'Inactive', '2021-03-05'),
('Meena', 'Finance', 60000, 'Active', '2020-11-20'),
('Rahul', 'IT', 30000, 'Probation', '2024-02-01');

-- 8. Validate BEFORE state
SELECT * FROM employees;

-- 7. Start transaction (if supported)
START TRANSACTION;

-- 3. Read filtered data
SELECT emp_id, emp_name, salary
FROM employees
WHERE department = 'IT'
  AND salary < 50000;

-- 4. Update records using conditions
UPDATE employees
SET salary = salary + 5000
WHERE department = 'IT'
  AND status = 'Active';

-- 5 & 6. Safe delete (always use WHERE)
DELETE FROM employees
WHERE status = 'Inactive';

-- 8. Validate AFTER state
SELECT * FROM employees;

-- Commit changes (use ROLLBACK to undo)
COMMIT;
