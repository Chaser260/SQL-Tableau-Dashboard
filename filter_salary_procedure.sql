/*
Create an SQL stored procedure that will allow you to obtain the average male and female salary per department
within a certain salary range. Let this range be defined by two values the user can insert when calling the 
procedure.
*/
SELECT MIN(salary) FROM t_salaries; # MIN(salary) = 31350
SELECT MAX(salary) FROM t_salaries; # MAX(salary) = 160377

DROP PROCEDURE IF EXISTS avg_salary_by_dept;

DELIMITER $$
CREATE PROCEDURE avg_salary_by_dept (IN p_min_salary FLOAT, IN p_max_salary FLOAT) #Use FLOAT due to currency
BEGIN
SELECT
	d.dept_name,
    e.gender,
    ROUND(AVG(salary),2) as avg_salary
FROM 
	t_employees e
		JOIN
	t_salaries s ON s.emp_no = e.emp_no
		JOIN
	t_dept_emp de ON de.emp_no = s.emp_no
		JOIN
	t_departments d ON d.dept_no = de.dept_no
WHERE 
	s.salary BETWEEN p_min_salary AND p_max_salary #Salary inputs need to be BETWEEN the IN parameters
GROUP BY 
	d.dept_no,
    e.gender
ORDER BY 
	d.dept_no;
END $$
DELIMITER ;

CALL avg_salary_by_dept(50000, 90000);