SELECT
    s.age AS Age_Group,
    COUNT(s.student_id) AS Total_Students,     -- COUNT
    AVG(s.score) AS Avg_Score,                  -- AVG (ignores NULL)
    SUM(s.score) AS Total_Score,                -- SUM
    MIN(s.score) AS Min_Score,                  -- MIN
    MAX(s.score) AS Max_Score                   -- MAX
FROM students s
WHERE
    s.department IN ('CSE', 'IT')               -- WHERE filters rows BEFORE grouping
GROUP BY
    s.age                                      -- Group students by age
HAVING
    COUNT(s.student_id) >= 2                   -- HAVING filters groups AFTER grouping
    AND AVG(s.score) IS NOT NULL;               -- Handle NULL aggregates
