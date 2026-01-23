SELECT
    s.student_id AS Rank_ID,
    s.name AS Student_Name,
    s.department AS Dept,
    s.score AS Score,
    s.city AS City
FROM students s
WHERE
    s.score IS NOT NULL              -- Edge case: avoid NULL scores
    AND s.department IN ('CSE', 'IT') -- Combine ORDER BY with WHERE
ORDER BY
    s.score DESC,                    -- 1. Sort descending (leaderboard)
    s.name ASC                       -- 2. Secondary sort (tie-breaker)
LIMIT 5                              -- 3. Limit results
OFFSET 0;                            -- 5. Pagination (page 1)
