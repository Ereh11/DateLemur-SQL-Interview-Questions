SELECT emp.employee_id,
       emp.name
FROM employee AS emp
INNER JOIN employee AS mang
ON emp.manager_id = mang.employee_id AND emp.salary > mang.salary;
