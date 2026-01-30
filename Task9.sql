
-- 1. Create salary data inside employees table (if not exists)
-- (Skip if salary column already exists)
ALTER TABLE employees
ADD COLUMN salary DECIMAL(10,2);

-- Sample salary update (only if table already has data)
UPDATE employees SET salary = 45000 WHERE emp_id = 101;
UPDATE employees SET salary = 42000 WHERE emp_id = 102;
UPDATE employees SET salary = 60000 WHERE emp_id = 103;
UPDATE employees SET salary = 70000 WHERE emp_id = 104;
UPDATE employees SET salary = 30000 WHERE emp_id = 105;

------------------------------------------------------------

-- 2. Subquery in WHERE:
-- Employees earning more than average salary
SELECT emp_id, emp_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

------------------------------------------------------------

-- 3a. Subquery in SELECT:
-- Show salary along with company average salary
SELECT
    emp_id,
    emp_name,
    salary,
    (SELECT AVG(salary) FROM employees) AS Avg_Company_Salary
FROM employees;

------------------------------------------------------------

-- 3b. Subquery in FROM:
-- Treat subquery as a derived table
SELECT *
FROM (
    SELECT emp_id, emp_name, salary
    FROM employees
) AS emp_salary_view
WHERE salary > 40000;

------------------------------------------------------------

-- 4. JOIN-based equivalent of subquery (comparison)
SELECT e.emp_id, e.emp_name, e.salary
FROM employees e
JOIN (
    SELECT AVG(salary) AS avg_salary
    FROM employees
) a
ON e.salary > a.avg_salary;

------------------------------------------------------------

-- 5. Correlated subquery:
-- Employees earning more than average salary of their department
SELECT e.emp_id, e.emp_name, e.salary, e.department_id
FROM employees e
WHERE salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);

------------------------------------------------------------

-- 6. Execution flow explanation (logical order)
-- Inner query executes first, then outer query uses its result
-- In correlated subquery, inner query runs once per outer row

------------------------------------------------------------

-- 7. When subqueries are unavoidable:
-- Example: Comparing row against aggregated group value

------------------------------------------------------------

-- 8. Debugging subquery errors
-- Common error example (commented):
-- SELECT * FROM employees WHERE salary = (SELECT salary FROM employees);
-- ERROR: Subquery returns more than one row

-- FIX using IN:
-- SELECT * FROM employees WHERE salary IN (SELECT salary FROM employees);

------------------------------------------------------------
