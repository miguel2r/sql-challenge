/*Data Analysis
List the following details of each employee: employee number, last name, first name, gender, and salary.*/

SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM   employee as e, salaries as s
WHERE  e.emp_no = s.emp_no;

--List employees who were hired in 1986.
SELECT  * FROM  employee
WHERE hire_date =to_date('1986', 'YYYY')

--List the manager of each department with the following information: department number, department name, 
--the manager's employee number,last name, first name, and start and end employment dates.


SELECT dm.dept_no,d.dept_name,e.emp_no,e.last_name, e.first_name,de.from_date,de.to_date
FROM dep_manager as dm, departments as d, employee as e,dep_emp as de
WHERE dm.dept_no = d.dept_no AND
      dm.emp_no = e.emp_no AND
	  de.emp_no = e.emp_no;
	  
--4 List the department of each employee with the following information: employee number,
--last name, first name, and department name.

SELECT e.emp_no,e.last_name, e.first_name, d.dept_name
FROM employee as e, dep_emp as de, departments as d
WHERE e.emp_no = de.emp_no AND 
      d.dept_no =de.dept_no;
	  
--5 List all employees whose first name is "Hercules" and last names begin with "B."

SELECT e.first_name,e.last_name
FROM employee as e
WHERE e.first_name = 'Hercules' AND 
      e.last_name  LIKE 'B%';

--6 List all employees in the Sales department, including their employee number, last name, 
--first name, and department name.

SELECT e.emp_no,e.last_name, e.first_name, d.dept_name
FROM employee as e, dep_emp as de, departments as d
WHERE e.emp_no = de.emp_no AND 
      d.dept_no =de.dept_no AND
	  d.dept_name = 'Sales';
	  
--7 List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.

SELECT e.emp_no,e.last_name, e.first_name, d.dept_name
FROM employee as e, dep_emp as de, departments as d
WHERE e.emp_no = de.emp_no AND 
      d.dept_no =de.dept_no AND 
	  d.dept_name IN ( 'Sales' , 'Development');
	  
	
--In descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.

SELECT e.last_name, COUNT(e.last_name) last_name_freq
FROM employee as e
GROUP BY e.last_name
ORDER BY last_name_freq DESC;


SELECT * FROM salaries
ORDER BY salary  desc;

SELECT  t.title , AVG(s.salary) avg_sal
FROM  title as  t, salaries as s
WHERE  s.emp_no = t.emp_no
GROUP BY  t.title
ORDER BY avg_sal DESC;


SELECT t.title , s.salary
FROM employee as e, title as  t, salaries as s
WHERE  e.emp_no = t.emp_no AND 
       s.emp_no =  e.emp_no
ORDER BY  t.title;




--Bonus (Optional)