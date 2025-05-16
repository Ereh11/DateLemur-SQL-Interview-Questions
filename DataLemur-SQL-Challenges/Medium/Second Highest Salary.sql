-- POSTGRESQL solution
SELECT salary AS second_highest_salary
FROM employee
ORDER BY second_highest_salary DESC
LIMIT 1 OFFSET 1;
-- T-SQL solution
SELECT TOP 1 salary AS second_highest_salary
FROM employee
WHERE salary < (
    SELECT MAX(salary)
    FROM employee
)
ORDER BY salary DESC;
-- Another T-SQL solution
WITH CTE AS
(
  SELECT salary,
         DENSE_RANK() OVER(ORDER BY salary DESC) AS RN
         
  FROM employee
)

SELECT salary AS second_highest_salary
FROM CTE 
WHERE RN = 2;