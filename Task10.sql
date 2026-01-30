
/* 1. Create base tables (if not already created) */
CREATE TABLE IF NOT EXISTS departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    salary DECIMAL(10,2),
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
        ON DELETE SET NULL
);

/* ----------------------------------------------------- */

/* Insert sample data */
INSERT INTO departments (department_id, department_name) VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Finance');

INSERT INTO employees (employee_id, employee_name, salary, department_id) VALUES
(101, 'Alice', 50000, 1),
(102, 'Bob', 70000, 2),
(103, 'Charlie', 65000, 2),
(104, 'Diana', 48000, NULL);

/* ----------------------------------------------------- */

/* 2. Create a complex query joining employees and departments */
-- (This query will be converted into a VIEW)
SELECT 
    e.employee_id,
    e.employee_name,
    e.salary,
    d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;

/* ----------------------------------------------------- */

/* 3. Convert the above query into a VIEW */
CREATE OR REPLACE VIEW employee_department_view AS
SELECT 
    e.employee_id,
    e.employee_name,
    e.salary,
    d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;

/* ----------------------------------------------------- */

/* 4. Query data directly from the created VIEW */
SELECT * FROM employee_department_view;

/* ----------------------------------------------------- */

/* 5. Apply filtering and sorting on the VIEW */
SELECT *
FROM employee_department_view
WHERE salary > 50000
ORDER BY salary DESC;

/* ----------------------------------------------------- */

/* 6. Attempt inserting data through the VIEW */
-- This will FAIL because the view is based on a JOIN
-- and is not updatable in MySQL

-- INSERT INTO employee_department_view
-- (employee_id, employee_name, salary, department_name)
-- VALUES (105, 'Evan', 60000, 'HR');

/* Explanation:
   Views created using JOINs are usually NOT updatable.
   MySQL blocks inserts to prevent data inconsistency.
*/

/* ----------------------------------------------------- */

/* 7. Drop and recreate VIEW safely */
DROP VIEW IF EXISTS employee_department_view;

CREATE VIEW employee_department_view AS
SELECT 
    e.employee_id,
    e.employee_name,
    e.salary,
    d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;

/* ----------------------------------------------------- */

/* 8. View usage for reporting dashboards */
-- Example: department-wise salary report
SELECT 
    department_name,
    COUNT(employee_id) AS total_employees,
    AVG(salary) AS avg_salary
FROM employee_department_view
GROUP BY department_name;
