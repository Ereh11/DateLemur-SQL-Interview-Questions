WITH CT AS
(
  SELECT title, AVG(salary) av
  FROM employee_pay
  GROUP BY title
)

SELECT DISTINCT ep.employee_id, salary,
      CASE WHEN salary >= 2 * CT.av THEN 'Overpaid' ELSE'Underpaid' END AS status
      
FROM employee_pay ep, CT
WHERE salary >= (2 * CT.av) OR salary * 2 <  CT.av AND ep.title = CT.title
ORDER BY employee_id;