# Pewlett-Hackard-Analysis
Creating Tables with SQL (Postgres)

## Overview:
In this challenge we were given the task to use SQL to find out which employees were retiring so that the company Pewlett-Hackard can plan accordingly. We used SQL to create relations between different tables in order to find out the retirees of each department and which retirees qualify for the mentorship program. 

## Purpose:
The purpose of this challenge is to develop our relational database skill set by having us create queries in SQL. In SQL we can create tables and relate them to one another to develop a relationship that we can analyze. 

## Resources
* Data Source: (departments, employees, dept_emp, dept_manager, salaries, titles).csv
* Software PostgreSQL 13.3. 

## Analysis:
### Overview of Analysis:
The purpose of this analysis can be seen in real world applications. Many companies need to plan their growth and finding out potential retirees is a part of their plan to grow. Finding out potential retirees can give the company the opportunity to be looking for new talent or growing their talent within into a more senior role. This can result in changing the financials of the company and outreach. 

### Results:
The results were surprising since I didn't think many people would retire as much as the results showed. Seeing below we have a total of 90,393 people retiring from different departments. 

![Retirees per Department](https://github.com/lo7kyle/World_Weather_Analysis/blob/main/Vacation_Search/WeatherPy_vacation_map.png) 

This result can be slightly skewed since this does not account employees that are currently working. We only considered people whose birthdates were between '1952-01-01' and '1955-12-31'. Using the current to_date employees, we get only a total of 33,118 retirees. Looking below at the new table we see that there are less people who are currently working that are retiring. 

![Current Retirees per Department](https://github.com/lo7kyle/World_Weather_Analysis/blob/main/Vacation_Search/WeatherPy_vacation_map.png) 

For the second part of the challenge, we were tasked to find how many people qualified for the mentorship program. Only 1,549 people qualified for the mentorship program which makes sense since we are only account people born in 1965 and no earlier or later date which might be a little exclusive. There are some people who have the means to retire earlier, and we should also include those as well. 

### Summary:
Seeing how there are only 1,549 people retiring born in 1965 we can assume that only 1,549 roles need to be filled immediately. This can come from potential promotions or hiring externally. We can create a querey for 1966, 1967, etc... to predict how many new hires per year so that HR or our fiancials can be easier to forecast. I would also include tables for different departments because we can focus which departments need more hires. We also see from the table above that the company doesn't need to hire that many managers compared to Senior Staff. 

I believe that there are enough qualified retirement-ready employees to mentor the next generation. A mentorship doesn't have to be a 1 to 1 ratio and a mentor can have multiple disciples. Similar to how there are only a few managers, the mentor number doesn't need to match the next generation of employees. I would create a query to find out how many people are not Senior level yet and use that number divided by the amount of job title. I would do this per department since every department is different and every role should be mentored by the next role, i.e:
``` sql
SELECT e.emp_no, 
        e.first_name, 
        e.last_name,
        t.title,
        t.from_date,
        t.to_date
FROM employees AS e 
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE t.to_date = ('9999-01-01')
ORDER BY e.emp_no; 
```
The above query should give you the current employees, then we would filter the current employees so that we only consider staff or engineer title for the mentorship. We won't have to consider those already in senior roles.
