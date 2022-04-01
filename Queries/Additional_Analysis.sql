-- ALL CURRENT EMPLOYEES' PERTINENT INFORMATION
-- EMPLOYEES
SELECT de.emp_no,
		e.first_name,
		e.last_name,
		e.birth_date,
		e.hire_date,
	d.dept_name,
	   de.to_date,
	   de.from_date		
INTO active_employees
FROM dept_emp as de
INNER JOIN employees as e
ON (de.emp_no = e.emp_no)
INNER JOIN departments as d
ON (de.dept_no = d.dept_no)
WHERE (de.to_date = '9999-01-01');
-- CHECK
SELECT * FROM current_employees_dpt;
-- Counts by department 
SELECT COUNT(emp_no), dept_name 
INTO active_emp_dpt
FROM active_employees
GROUP BY dept_name
ORDER BY COUNT(emp_no) DESC; 

-- Use overlap between dpt_emp and dpt_manager to query same information about managers
SELECT ae.emp_no,
ae.birth_date,
ae.hire_date,
ae.dept_name
INTO active_managers
FROM active_employees as ae
INNER JOIN dept_manager as dm
ON (ae.emp_no = dm.emp_no)
WHERE (dm.to_date = '9999-01-01');
-- COUNT by department 
SELECT COUNT(emp_no), dept_name 
INTO active_manag_dpt
FROM active_managers
GROUP BY dept_name
ORDER BY COUNT(emp_no) DESC; 

-- RETIRING EMPLOYEES AND MANAGERS 
-- EMPLOYEES
SELECT * 
INTO retire_age_emps
FROM active_employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31'); 
-- by DEPARTMENTS 
SELECT COUNT(emp_no), dept_name
INTO ret_emps_by_dept
FROM retire_age_emps 
GROUP BY dept_name
ORDER BY COUNT(emp_no) DESC;

-- MANAGERS BY DEPARTMENTS
SELECT COUNT(rae.emp_no), rae.dept_name 
INTO retire_age_managers_dpt
FROM retire_age_emps AS rae
INNER JOIN dept_manager AS dm
ON (rae.emp_no = dm.emp_no)
WHERE (dm.to_date = '9999-01-01')
GROUP BY rae.dept_name
ORDER BY COUNT(rae.emp_no) DESC;

-- Retirement Package Eligable Employees (Hired between 1985-1988)
SELECT COUNT(emp_no), dept_name 
INTO retire_package_eligable_dpt
FROM retire_age_emps
WHERE (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
GROUP BY dept_name
ORDER BY COUNT(emp_no) DESC;
