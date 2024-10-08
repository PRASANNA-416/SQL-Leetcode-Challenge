# Write your MySQL query statement below

WITH CTE AS 
(SELECT mr.*, u.name, m.title
FROM MovieRating mr
LEFT JOIN Users u
ON mr.user_id = u.user_id
LEFT JOIN Movies m
ON mr.movie_id = m.movie_id)


(SELECT name AS results
FROM cte
GROUP BY name
ORDER BY COUNT(*) DESC, name
LIMIT 1)

UNION
(
SELECT title
FROM cte
WHERE DATE_FORMAT(created_at, '%Y-%m') = '2020-02'
GROUP BY title
ORDER BY AVG(rating) DESC, title
LIMIT 1
)
