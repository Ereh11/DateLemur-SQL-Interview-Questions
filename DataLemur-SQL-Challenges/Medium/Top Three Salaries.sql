-- T-SQL Solution
WITH CTE AS
(
  SELECT department_name,
         name,
         salary,
         DENSE_RANK() OVER(PARTITION BY department_name ORDER BY salary DESC)  AS RN
  FROM employee AS E
  JOIN department AS D
  ON E.department_id = D.department_id
)

SELECT department_name,
       name,
       salary
FROM CTE
WHERE RN IN (1, 2, 3)
ORDER BY department_name, salary DESC, name;