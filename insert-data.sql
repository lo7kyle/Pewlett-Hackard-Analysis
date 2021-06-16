-- Importing data

COPY departments(dept_no, dept_name)
FROM 'C:\Users\Admin\OneDrive\Data Analytics Bootcamp\Module 7_SQL\Pewlett-Hackard-Analysis\Data\departments.csv'
WITH DELIMITER ',' 
CSV HEADER; 

COPY employees(emp_no,birth_date,first_name,last_name,gender,hire_date)
FROM 'C:\Users\Admin\OneDrive\Data Analytics Bootcamp\Module 7_SQL\Pewlett-Hackard-Analysis\Data\employees.csv'
WITH DELIMITER ',' 
CSV HEADER; 

COPY dept_emp(emp_no,dept_no,from_date,to_date)
FROM 'C:\Users\Admin\OneDrive\Data Analytics Bootcamp\Module 7_SQL\Pewlett-Hackard-Analysis\Data\dept_emp.csv'
WITH DELIMITER ',' 
CSV HEADER; 

COPY dept_manager(dept_no,emp_no,from_date,to_date)
FROM 'C:\Users\Admin\OneDrive\Data Analytics Bootcamp\Module 7_SQL\Pewlett-Hackard-Analysis\Data\dept_manager.csv'
WITH DELIMITER ',' 
CSV HEADER; 


COPY salaries(emp_no,salary,from_date,to_date)
FROM 'C:\Users\Admin\OneDrive\Data Analytics Bootcamp\Module 7_SQL\Pewlett-Hackard-Analysis\Data\salaries.csv'
WITH DELIMITER ',' 
CSV HEADER;  

COPY titles(emp_no,title,from_date,to_date)
FROM 'C:\Users\Admin\OneDrive\Data Analytics Bootcamp\Module 7_SQL\Pewlett-Hackard-Analysis\Data\titles.csv'
WITH DELIMITER ',' 
CSV HEADER;  

-- CHECKS TO SEE IF DATA IS IMPORTED
SELECT * FROM employees LIMIT(100)