CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      
      WITH CTE AS
      (SELECT *, DENSE_RANK() OVER(ORDER BY Salary DESC) AS rnk
      FROM Employee)

      SELECT DISTINCT IFNULL(salary, null)
      FROM CTE
      WHERE rnk = N
  );
END
