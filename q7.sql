--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, 
	e.last_name, 
	e.first_name, 
	d.dept_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = CAST(de.emp_no AS INT)
JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');