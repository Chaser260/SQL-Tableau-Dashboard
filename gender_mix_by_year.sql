use employees_mod;
/* Create a visualization that provides a breakdown between the male and female
employees working in the company each year, starting from 1990. */

# Check for duplicates
SELECT emp_no, from_date, to_date FROM t_dept_emp; #331723 rows
SELECT DISTINCT emp_no, from_date, to_date FROM t_dept_emp; #331723 rows. No duplicates per contract

# Solution
SELECT
	YEAR(de.from_date) as calendar_year,
    e.gender,
    COUNT(e.emp_no) as num_of_employees
FROM
	t_employees e
		JOIN
	t_dept_emp de ON e.emp_no = de.emp_no
GROUP BY calendar_year, e.gender
HAVING calendar_year >= '1990';
