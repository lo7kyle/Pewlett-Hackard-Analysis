-- RETIRED TITLES
SELECT e.emp_no, 
        e.first_name, 
        e.last_name,
        t.title,
        t.from_date,
        t.to_date
INTO retirement_titles
FROM employees AS e 
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no; 
SELECT * FROM retirement_titles;
-- SAVES RETIREMENT_TITLES QUEREY INTO CSV FILE
COPY retirement_titles TO 'C:\Users\Admin\OneDrive\Data Analytics Bootcamp\Module 7_SQL\Pewlett-Hackard-Analysis\Data\retirement_titles.csv' 
DELIMITER ',' 
CSV HEADER;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles AS rt
ORDER BY rt.emp_no ASC, rt.to_date DESC;
SELECT * FROM unique_titles; 
-- Save Table to csv
COPY unique_titles TO 'C:\Users\Admin\OneDrive\Data Analytics Bootcamp\Module 7_SQL\Pewlett-Hackard-Analysis\Data\unique_titles.csv' 
DELIMITER ',' 
CSV HEADER;

-- COUNT per title of retiree
SELECT COUNT(ut.emp_no) AS RetireeCount, ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY RetireeCount DESC
-- Save Table to csv
COPY retiring_titles TO 'C:\Users\Admin\OneDrive\Data Analytics Bootcamp\Module 7_SQL\Pewlett-Hackard-Analysis\Data\retiring_titles.csv' 
DELIMITER ',' 
CSV HEADER;

-- Mentorship Eligibility
SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
INTO mentorship_eligibilty
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = ('9999-01-01')) AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no ASC; 
-- Save Table to csv
COPY mentorship_eligibilty TO 'C:\Users\Admin\OneDrive\Data Analytics Bootcamp\Module 7_SQL\Pewlett-Hackard-Analysis\Data\mentorship_eligibilty.csv' 
DELIMITER ',' 
CSV HEADER;
