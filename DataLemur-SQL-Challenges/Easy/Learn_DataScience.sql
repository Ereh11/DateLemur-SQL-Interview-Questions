CREATE DATABASE sales;
USE sales;
CREATE TABLE sales
(
	purchase_number INT NOT NULL primary key auto_increment,
    data_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10) NOT NULL
);
DROP TABLE sales;
CREATE TABLE customers
(
	cutomer_id INT NOT NULL primary key,
    first_name varchar(255),
    last_name varchar(255),
    email_address varchar(255),
    number_of_complaints INT
);
CREATE TABLE items
(
	item_code varchar(255),
    iyem varchar(255),
    unit_price numeric(10,2),
    company_id varchar(255)
);
CREATE TABLE companies
(
	company_id varchar(255),
    company_name varchar(255),
    headquarters_phone_number INT(12)
);
ALTER TABLE sales
add foreign key(customer_id) references customers(customer_id) ON DELETE CASCADE;
ALTER TABLE sales
DROP FOREIGN KEY customer_id;
ALTER TABLE customers
ADD UNIQUE KEY(email_address);
ALTER TABLE customers
DROP INDEX email_address;
DROP TABLE customers;
CREATE TABLE customers
(
	customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
	PRIMARY KEY (customer_id)
);
ALTER TABLE customers
ADD COLUMN gender ENUM('M','F') After last_name;
INSERT INTO customers (first_name, last_name, gender, email_address, number_of_complaints)
VALUES ('John', 'Mackinley', 'M', 'john.mckinley@365datascience.com', 0);
ALTER TABLE customers
CHANGE COLUMN number_of_complaints number_of_complaints INT DEFAULT 0;
ALTER TABLE customers
ALTER COLUMN number_of_complaints DROP DEFAULT;
CREATE TABLE companies
(
	company_id VARCHAR(255),
    company_name VARCHAR(255),
    headquarters_phone_number VARCHAR(255) UNIQUE KEY DEFAULT 'X'
);
DROP TABLE companies;
ALTER TABLE companies
modify headquarters_phone_number varchar(255) null;
ALTER TABLE companies
CHANGE headquarters_phone_number headquarters_phone_number varchar(255) NOT null;
SELECT dept_no FROM departments;
SELECT * FROM employees
WHERE first_name =  "Elvis";
SELECT * FROM employees
WHERE first_name NOT LiKE ('%Jack%');
SELECT * FROM dept_emp
WHERE dept_no BETWEEN 'd003' AND 'd006';
SELECT * FROM salaries
WHERE hire_date >= '2000-01-01' AND gender ='F';
SELECT DISTINCT(hire_date) FROM employees;
SELECT COUNT(emp_no) FROM salaries
WHERE salary>=100000;
SELECT * FROM employees
ORDER BY hire_date DESC;
SELECT first_name, count(first_name)
FROM employees
GROUP BY first_name
ORDER BY first_name DESC;
SELECT salary, count(emp_no) AS emps_with_same_salary
FROM salaries
WHERE salary>80000
GROUP BY salary
ORDER BY salary;
SELECT emp_no FROM dept_emp
WHERE from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(emp_no)>1;
SELECT * FROM dept_emp
LIMIT 100;
INSERT INTO employees
VALUES( 999903, '1977-09-14', 'Johnathan', 'Creek', 'M', '1999-01-01');
INSERT INTO titles (emp_no, title, from_date)
VALUES (999903, 'Senior Engineer', '1997-10-01');
SELECT * FROM titles
ORDER BY emp_no DESC;
INSERT INTO dept_emp
VALUES (999903, 5, '1997-10-01','9999-01-01');
UPDATE departments
SET dept_name='Data Analysis'
WHERE dept_name='Business Analysis';
SELECT * FROM departments
WHERE dept_name='Data Analysis';
DELETE FROM departments
WHERE dept_no='10';
SELECT COUNT(*) FROM dept_emp;
SELECT SUM(salary) FROM salaries
WHERE from_date ='1997-01-01';
SELECT AVG(salary) FROM salaries
WHERE from_date='1997-01-01';
SELECT dept_no, dept_name,
COALESCE(dept_no,dept_name) AS dept_info;
SELECT IFNULL(dept_no,'N/A') AS dept_no,  
IFNULL(dept_name,'Department name not providedA')dept_name,
COALESCE(dept_no,dept_name) AS dept_info 
FROM departments
ORDER BY dept_no ASC;
SELECT e.emp_no, e.first_name, e.last_name, e.hire_date, d.dept_no
FROM employees e
JOIN dept_manager d ON e.emp_no=d.emp_no;
SELECT e.emp_no, e.first_name, e.last_name, d.from_date, d.dept_no
FROM employees e
LEFT JOIN dept_manager d ON e.emp_no=d.emp_no
WHERE e.last_name='Markovitch'
ORDER BY d.dept_no DESC, e.emp_no;
SELECT e.emp_no, e.first_name, e.last_name, d.dept_no, d.from_date
FROM dept_emp d, employees e
WHERE e.emp_no=d.emp_no;
SELECT e.emp_no, e.first_name, e.last_name, e.hire_date, t.title
FROM employees e
JOIN titles t ON e.emp_no=t.emp_no
WHERE e.first_name= "Margareta" AND e.last_name= "Markovitch";
SELECT m.*, d.*
FROM dept_manager m
CROSS JOIN departments d
WHERE d.dept_no='d009';
SELECT e.*, d.*
FROM employees e
CROSS JOIN departments d
WHERE e.emp_no < 10011
ORDER BY e.emp_no, d.dept_name;
SELECT e.first_name, e.last_name, e.hire_date, t.title, dm.from_date, d.dept_name
FROM employees e
	JOIN 
dept_manager dm ON dm.emp_no= e.emp_no
    JOIN 
departments d ON dm.dept_no= d.dept_no
	JOIN
titles t ON t.emp_no= e.emp_no
WHERE t.title='Manager';
SELECT e.gender, COUNT(e.gender) as NumberOfGender
FROM employees e
JOIN 
titles t on e.emp_no= t.emp_no
WHERE t.title= 'Manager'
GROUP BY e.gender;
SELECT * FROM dept_manager 
WHERE emp_no IN 
( 
SELECT emp_no FROM employees
WHERE hire_date BETWEEN '1990-01-1' AND '1995-01-1'
);
SELECT * FROM employees e
WHERE EXISTS 
( 
	SELECT emp_no FROM titles t
    WHERE title= "Assistant Engineer" AND e.emp_no=t.emp_no
);
CREATE OR REPLACE VIEW v_salary As
SELECT ROUND(AVG(salary),2) as avg_salary FROM salaries s
	JOIN titles t ON  t.emp_no= s.emp_no
WHERE t.title='manager';
DELIMITER $$
CREATE PROCEDURE avg_salary()
BEGIN
 SELECT AVG(salary) as average
 FROM salaries;
END$$
DELIMITER ;
DELIMITER $$
CREATE PROCEDURE emp_info(in first_name varchar(255),last_name varchar(255), out employee_number integer)
BEGIN
	SELECT emp_no INTO employee_number FROM employees e
    WHERE e.first_name= first_name AND e.last_name= last_name;
END$$
DELIMITER ;
DROP PROCEDURE emp_info;
SET @v_emp_no=0;
CALL emp_info("Aruna","Journel",@v_emp_no);
SELECT @v_emp_no;
##GRANT SELECT, INSERT, UPDATE, DELETE ON contacts TO 'smithj'@'localhost';
##REVOKE DELETE, UPDATE ON contacts FROM 'smithj'@'localhost';