--List the first name, last name, and hire date for the employees who were hired in 1986

SELECT
	e.first_name,
	e.last_name,
	e.hire_date
	
FROM employees AS e

WHERE EXTRACT(YEAR FROM hire_date) = 1986;