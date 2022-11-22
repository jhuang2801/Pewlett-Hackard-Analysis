# Pewlett-Hackard-Analysis
## Overview of the analysis: Explain the purpose of this analysis.
The objective of this analysis is to use SQL to organize information from across multiple tables/files. Primary keys and foreign keys are used as unique identifiers to show the relationship between two tables. For example, title table only has inforamtion on employee number and title, but it is missing informatoin such as employee first and last names. SQL is then used to join information between these tables. Specifically, "emp_no" is a primary key that appears in both tables so it is used to join employees information (first name and last name organized by emp_no) with their appropriate title from the titles table. SQL can further organize data by using GROUP BY, ORDER BY, and filter based on user query.
## Results: Provide a bulleted list with four major points from the two analysis deliverables. Use images as support where needed.
1. A new table called retirement_titles is created by joining the emp_no as the primary key from both titles (containing only emp_no, title, from date and to date for each title ) and employees (containing only emp_no, birth date, first name, last name, gender, and hire date) table. As a result, the retirement_titles table is created with information with selected columns from both tables including emp_no, first and last name of employees, title of employees, from date and to date for each title that each employee has held. Additionally, the birth_date column was also filtered out for retirement-ready employees who were born between 1952 and 1955.
2. From the previously created table, some rows are duplicated if an employee has held mulitple titles. For example, emp_no 10004 has held two titles in the company - engineer from 1986 to 1995, and then senior engineer from 1995 to present day. In order to filter the date for only unique results for each employee, DISTINCT ON and ORDER BY were used to filter out the "to_date" column for the most recent title held by each employee, and also filter out employees who are no longer employed. The results are organized into a new table called unique_titles. The final count for retirement-ready employees is 72,458.
3. From the data gathered in unique_titles, a new table called retiring_titles is created to show the the count of unique titles in the retirement-ready employee population. "Senior Engineer" and "Senior Staff" have the highest count with about 25,000 each, and the two titles accounted for about 70% of all retiring titles. 
4. A mentorship_eligibility table is created to filter out current employees who were born in the year of 1965. The table is created by using emp_no as the primary key from employees, dept_emp, and titles table, containing columns first name, last name, and birth date from the employees table, columns from_date, to_date from dept_emp table, and column title from the titles table. The data was then filtered further by selecting current employees only, and birth date is in 1965. Only 1549 employees are eligible for mentorship.
## Summary: Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."
### How many roles will need to be filled as the "silver tsunami" begins to make an impact?
Using unique_titles table, we learned that 72,458 of the current employees are retirement ready. "Senior Engineer" and "Senior Staff" have the highest count with about 25,000 each, and the two titles accounted for about 70% of all retiring titles. 
### Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
From 72,458 retirement-ready employees, only 1549 or 2% of 72,458 employees are eligible for mentorship (people who are born in 1965), which is highly unrealistic. Further more, since "senior engineers" and "senior staff" occupied about 70% of the titles of the retirement group, these two groups will suffer the most to fulfill the positions from the retirement group - with each group losing about 25,000 people each to retirement. In order to understand the impact of losing the retiring employees, we need to dive deeper into the relationship of what department these people are in. For example, emp_no 10005 and 10058 both hold the same title as "senior staff", but emp_no 10005 is in dept_no d0003/Human resources, and emp_no 10058 is in dept_no d0007/Sales. We can use emp_no as a primary key again to link dept_emp to the unique_titles table to see which dept_no these employees belong to, and then use dept_no from dept_emp to link to departments tables for dept_name. We can then observe the number of mentorship eligible employees in each department to further assess the impact.
