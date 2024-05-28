--drop old databases so can easily run over and over
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

---create the 6 tables
CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title_id VARCHAR(50),
	birth_date DATE,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	sex VARCHAR(50),
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	PRIMARY KEY (emp_title_id)
	);

ALTER TABLE employees
RENAME COLUMN emp_title_id TO title_id;

SELECT * FROM employees;
	
CREATE TABLE departments(
	dept_no VARCHAR(50),
	dept_name VARCHAR(50),
	PRIMARY KEY (dept_no)
	);

SELECT * FROM departments;

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR(50),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	);

SELECT * FROM dept_emp;

CREATE TABLE dept_manager(
	dept_no VARCHAR(50),
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	);
SELECT * FROM dept_manager;

CREATE TABLE salaries(
	emp_no INT,
	salary INT,
	FOREIGN KEY emp_no REFERENCES employees(emp_no)
	);

CREATE TABLE titles(
	title_id VARCHAR(50),
	title VARCHAR(50),
	FOREIGN KEY title_id REFERENCES employees(emp_title_id)
	);

SELECT * FROM titles;

--large table
SELECT *
FROM salaries
JOIN employees
	ON (salaries.emp_no = employees.emp_no)


	
--question 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT
    employees.emp_no AS employee_number,
    employees.last_name,
    employees.first_name,
    employees.sex,
    salaries.salary
FROM
    employees
JOIN
    salaries ON employees.emp_no = salaries.emp_no;


	

