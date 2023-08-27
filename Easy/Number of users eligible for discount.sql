
SELECT COUNT(DISTINCT user_id) AS user_cnt
FROM Purchases
WHERE timestamp BETWEEN startDate and endDate
AND amount >= minAmount
