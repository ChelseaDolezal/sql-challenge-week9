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
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
	);

ALTER TABLE employees
RENAME COLUMN emp_title_id TO title_id;

SELECT * FROM employees;
	
CREATE TABLE departments (
	dept_no VARCHAR,
	dept_name VARCHAR
	);


CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	);

CREATE TABLE dept_manager(
	dept_no VARCHAR(50),
	emp_no INT(50),
	PRIMARY KEY (emp_no)
	);

CREATE TABLE salaries(
	emp_no INT,
	salary INT,
	PRIMARY KEY (emp_no)
	);

CREATE TABLE titles(
	title_id VARCHAR,
	title VARCHAR
	);

SELECT *
FROM salaries
JOIN employees
	ON (salaries.emp_no = employees.emp_no)
JOIN dept_manager
	ON 

	
--SELECT * FROM titles; ---use this to look at the titles table.

--merge tables together
--SELECT * FROM TABLE departments INNER JOIN othertable ON dept_emp.dept_no;
SELECT * FROM salaries
