/***
Table: Seat

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| student     | varchar |
+-------------+---------+
id is the primary key (unique value) column for this table.
Each row of this table indicates the name and the ID of a student.
id is a continuous increment.
 

Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.

Return the result table ordered by id in ascending order.

The result format is in the following example.

 

Example 1:

Input: 
Seat table:
+----+---------+
| id | student |
+----+---------+
| 1  | Abbot   |
| 2  | Doris   |
| 3  | Emerson |
| 4  | Green   |
| 5  | Jeames  |
+----+---------+
Output: 
+----+---------+
| id | student |
+----+---------+
| 1  | Doris   |
| 2  | Abbot   |
| 3  | Green   |
| 4  | Emerson |
| 5  | Jeames  |
+----+---------+
Explanation: 
Note that if the number of students is odd, there is no need to change the last one's seat.
***/

# Write your MySQL query statement below


WITH cte AS
(SELECT *, LEAD(id) OVER(ORDER BY id) AS next, LAG(id) OVER(ORDER BY id) AS prev
FROM Seat)
/***
+----+---------+
| id | student | next | prev
+----+---------+
| 1  | Abbot   |  2   |  null
| 2  | Doris   |  3   |   1
| 3  | Emerson |  4   |   2
| 4  | Green   |  5   |   3
| 5  | Jeames  | null |   4
+----+---------+

***/

SELECT CASE WHEN ((id % 2 = 1) AND next IS NOT NULL) THEN next
WHEN (id%2 = 0) THEN prev
ELSE id END AS id, student 
FROM cte
ORDER BY id
