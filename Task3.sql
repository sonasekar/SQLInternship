SELECT 
    s.student_id AS ID,
    s.name AS Student_Name,
    s.age AS Age,
    s.email AS Email,
    s.department AS Dept
FROM students s
WHERE
    -- 1. Filter by age
    s.age BETWEEN 18 AND 25

    -- 2. Combine conditions using AND / OR
    AND (s.department = 'CSE' OR s.department = 'IT')

    -- 3. Search names using LIKE with % and _
    AND s.name LIKE 'A_%'          -- Name starts with A and has at least 2 characters

    -- 4. Filter using IN
    AND s.city IN ('Chennai', 'Bangalore', 'Hyderabad')

    -- 5. Handle NULL values
    AND s.phone_number IS NULL

    -- 6 & 8. Real-life scenario: email search using LIKE
    AND s.email LIKE '%@gmail.com';
