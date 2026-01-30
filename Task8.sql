

-- 1. Use previously created employees and departments tables
-- (Validation step: ensure tables exist and view data)
SELECT * FROM employees;
SELECT * FROM departments;

------------------------------------------------------------

-- 2. INNER JOIN: Fetch employees with their department names
SELECT
    e.emp_id,
    e.emp_name,
    d.department_name
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id;

------------------------------------------------------------

-- 3. LEFT JOIN: Identify employees without departments
SELECT
    e.emp_id,
    e.emp_name,
    d.department_name
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

------------------------------------------------------------

-- 4. RIGHT JOIN: List all departments including empty ones
SELECT
    e.emp_id,
    e.emp_name,
    d.department_name
FROM employees e
RIGHT JOIN departments d
    ON e.department_id = d.department_id;

------------------------------------------------------------

-- 5. FULL JOIN simulation using UNION (MySQL workaround)
SELECT
    e.emp_id,
    e.emp_name,
    d.department_name
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id

UNION

SELECT
    e.emp_id,
    e.emp_name,
    d.department_name
FROM employees e
RIGHT JOIN departments d
    ON e.department_id = d.department_id;

------------------------------------------------------------

