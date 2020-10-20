-- Employees' details
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM employees as e
	LEFT JOIN salaries as s
	ON (e.emp_no = s.emp_no);
	
--Employees hired during 1986
SELECT
	first_name,
	last_name,
	hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--Department Managers
SELECT
	dman.dept_no,
	dep.dept_name,
	dman.emp_no,
	e.last_name,
	e.first_name
FROM dept_manager as dman
	INNER JOIN departments as dep
		ON(dman.dept_no = dep.dept_no)
	INNER JOIN employees as e
		ON(dman.emp_no = e.emp_no)

--Employee's Department
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	dep.dept_name
FROM employees as e
	INNER JOIN dept_emp
		ON (dept_emp.emp_no = e.emp_no)
	INNER JOIN departments as dep
		ON(dep.dept_no = dept_emp.dept_no)
		
--"Hercules B." information
SELECT
	first_name,
	last_name,
	birth_date,
	sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--Employees in the Sales Dept
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	dep.dept_name
FROM employees AS e
	INNER JOIN dept_emp
		ON(e.emp_no = dept_emp.emp_no)
	INNER JOIN departments as dep
		ON (dept_emp.dept_no = dep.dept_no)
WHERE dep.dept_name = 'Sales';

--Employes in Sales or Development
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	dep.dept_name
FROM employees AS e
	INNER JOIN dept_emp
		ON(e.emp_no = dept_emp.emp_no)
	INNER JOIN departments as dep
		ON (dept_emp.dept_no = dep.dept_no)
WHERE dep.dept_name = 'Sales'
OR dep.dept_name = 'Development';
	
--Frequency of Employee last names in descending order
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;

--ID 499942
SELECT first_name, last_name, emp_no
FROM employees
WHERE emp_no = 499942;