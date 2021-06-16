-- Queries --

-- Determine Retirement Eligibility '52-55'
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT COUNT (first_name) as retiredCount FROM employees 
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Determine Retirement Eligibility 'Jan 52- Dec 52'
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

SELECT COUNT (first_name) as retiredCount FROM employees 
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- Determine Retirement Eligibility 'Jan 53- Dec 53'
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

SELECT COUNT (first_name) as retiredCount FROM employees 
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- Determine Retirement Eligibility 'Jan 54- Dec 54'
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

SELECT COUNT (first_name) as retiredCount FROM employees 
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- Determine Retirement Eligibility 'Jan 55- Dec 55'
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

SELECT COUNT (first_name) as retiredCount FROM employees 
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- Adding an additional requirement
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Store querey table into a new table so we can export
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
SELECT * FROM retirement_info;

-- Joins
SELECT first_name, last_name, title
FROM employees as e
LEFT JOIN titles as t ON e.emp_no = t.emp_no;

-- Drop retirement_info and SELECT new one with emp_no
DROP TABLE retirement_info;

SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- CHECK TABLE
SELECT * FROM retirement_info;
-- SAVES RETIREMENT_INFO QUEREY INTO CSV FILE
COPY retirement_info TO 'C:\Users\Admin\OneDrive\Data Analytics Bootcamp\Module 7_SQL\Pewlett-Hackard-Analysis\Data\retirement_info.csv' 
DELIMITER ',' 
CSV HEADER;


-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

-- Filtering out employees that already left using join
SELECT retirement_info.emp_no,
		retirement_info.first_name,
		retirement_info.last_name,
		dept_emp.to_date
FROM retirement_info 
LEFT JOIN dept_emp
ON retirement_info.emp_no = dept_emp.emp_no;

-- using alias to simplify querey
SELECT ri.emp_no,
		ri.first_name,
		ri.last_name,
		de.to_date
FROM retirement_info  as ri 
LEFT JOIN dept_emp as de 
ON ri.emp_no = de.emp_no;

-- using alias to simplify querey
SELECT d.dept_name,
		dm.emp_no,
		dm.from_date,
		dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

-- Left join for retirement_info and dept_emp
SELECT ri.emp_no,
		ri.first_name,
		ri.last_name,
		de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');
SELECT * FROM current_emp;

-- SAVES CURRENT_EMP QUEREY INTO CSV FILE
COPY current_emp TO 'C:\Users\Admin\OneDrive\Data Analytics Bootcamp\Module 7_SQL\Pewlett-Hackard-Analysis\Data\current_emp.csv' 
DELIMITER ',' 
CSV HEADER;

-- Employee count by department number
SELECT COUNT(ce.emp_no) as EmployeeCount, de.dept_no
INTO employee_count
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

SELECT * FROM employee_count;

-- SAVES CURRENT_EMP QUEREY INTO CSV FILE
COPY employee_count TO 'C:\Users\Admin\OneDrive\Data Analytics Bootcamp\Module 7_SQL\Pewlett-Hackard-Analysis\Data\employee_count.csv' 
DELIMITER ',' 
CSV HEADER;

