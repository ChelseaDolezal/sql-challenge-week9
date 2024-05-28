--Question 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
    e.emp_no,
    e.title_id,
    e.birth_date,
    e.first_name,
    e.last_name,
    e.sex,
    e.hire_date,
    d.dept_no AS emp_dept_no,
    de.dept_no AS emp_dept_assigned,
    dm.dept_no AS manager_dept_no,
    s.salary,
    t.title
FROM 
    employees AS e
LEFT JOIN 
    dept_emp AS de ON e.emp_no = CAST(de.emp_no AS INT)
LEFT JOIN 
    dept_manager AS dm ON e.emp_no = CAST(dm.emp_no AS INT)
LEFT JOIN 
    salaries AS s ON e.emp_no = s.emp_no
LEFT JOIN 
    titles AS t ON e.title_id = t.title_id
LEFT JOIN 
    departments AS d ON de.dept_no = d.dept_no;




SELECT 
    dm.dept_no AS department_number,
    d.dept_name AS department_name,
    dm.emp_no AS manager_employee_number,
    e.last_name AS manager_last_name,
    e.first_name AS manager_first_name
FROM 
    dept_manager AS dm
JOIN 
    employees AS e ON dm.emp_no::varchar = e.emp_no::varchar
JOIN 
    departments AS d ON dm.dept_no = d.dept_no;