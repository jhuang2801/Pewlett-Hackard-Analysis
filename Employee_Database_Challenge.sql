--Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT emp_no, first_name, last_name from employees;

--Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT title, from_date, to_date from titles;

--Create a new table using the INTO clause.
SELECT e.emp_no,
    e.first_name,
	e.last_name,
    titles.title,
	titles.from_date,
    titles.to_date
INTO retirement_titles
FROM employees as e
--Join both tables on the primary key.
LEFT JOIN titles
ON (e.emp_no = titles.emp_no)
--Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;
--Export the Retirement Titles table from the previous step as retirement_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title,
from_date,
to_date

INTO unique_titles
FROM retirement_titles
WHERE retirement_titles.to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

--RETRIEVE THE NUMBER OF EMPLOYEES BY THE MOST RECENT JOB TITLE ABOUT TO RETIRE
SELECT title, COUNT (title) 
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

--a query to create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program.

SELECT emp_no, first_name, last_name, birth_date FROM employees;
SELECT from_date, to_date FROM dept_emp;
SELECT title FROM titles;

SELECT DISTINCT ON (emp_no) 
employees.emp_no,
    employees.first_name,
	employees.last_name,
    employees.birth_date,
	dept_emp.from_date,
	dept_emp.to_date,
	titles.title
INTO mentorship_eligibility
FROM employees
INNER JOIN dept_emp
ON (employees.emp_no = dept_emp.emp_no)
INNER JOIN titles
ON (employees.emp_no = titles.emp_no)
WHERE (dept_emp.to_date = '9999-01-01') AND 
	(employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;

SELECT * FROM mentorship_eligibility;

DROP TABLE mentorship_eligibility;


