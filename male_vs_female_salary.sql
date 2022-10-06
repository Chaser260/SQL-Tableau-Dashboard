/* 
Compare the average salary of female versus male employees in the enitre company
until year 2002, and add a filter allowing you to see that per each department
*/

SELECT 
	d.dept_name,
    e.gender,
    ROUND(avg(salary),2) as salary,
    YEAR(s.from_date) as year
FROM 
	t_salaries s
		JOIN
	t_employees e ON s.emp_no = e.emp_no
		JOIN
	t_dept_emp de ON e.emp_no = de.emp_no
		JOIN
	t_departments d ON de.dept_no = d.dept_no
GROUP BY 
	d.dept_no,
    e.gender,
    year
HAVING
	year <= 2002
ORDER BY 
	d.dept_no;
	
    