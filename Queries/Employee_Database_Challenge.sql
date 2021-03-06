-- Deliverable 1: Number of Retiring Employees by Title
SELECT e.emp_no, 
		e.first_name, 
		e.last_name,
			ti.title,
			ti.from_date,
			ti.to_date	
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no ASC;

-- Removing Duplicate Rows and Selecting Current Employees' Most Recent Title
SELECT DISTINCT ON(emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles 
WHERE to_date = '9999-01-01'
ORDER BY emp_no ASC, to_date DESC;

-- Group Retiring Current Employees by Titles and Count Them
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT(ut.emp_no) DESC;

-- Deliverable 2 Eligable Employees for Mentorship Program 
SELECT DISTINCT ON(e.emp_no) e.emp_no, 
		e.first_name, 
		e.last_name,
		e.birth_date,
			de.from_date,
			de.to_date, 
				ti.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no ASC;

-- Supplemental Queries 
-- See mentorship eligable employees by department 
SELECT COUNT(me.emp_no), d.dept_name 
FROM mentorship_eligibility AS me
INNER JOIN dept_emp AS de
ON (me.emp_no = de.emp_no)
INNER JOIN departments AS d 
ON (de.dept_no = d.dept_no)
WHERE (de.to_date = '9999-01-01')
GROUP BY d.dept_name;

-- See mentees by title. 
SELECT COUNT(emp_no), title 
FROM mentorship_eligibility
GROUP BY title;

-- See All Current Employees by Title
SELECT COUNT(ae.emp_no), ti.title 
FROM active_employees AS ae
INNER JOIN titles AS ti
ON (ae.emp_no = ti.emp_no)
WHERE (ti.to_date = '9999-01-01')
GROUP BY ti.title
ORDER BY COUNT(ae.emp_no) DESC;