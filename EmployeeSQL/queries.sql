--1. List the employee number, last name, first name, sex, and salary of each employee.
select employee.emp_no, employee.last_name,  employee.first_name, salary.salary from employee 
join salary on employee.emp_no = salary.emp_no 
order by employee.emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986
select first_name, last_name, hire_date from employee 
where date_part('year',hire_date) = 1986;

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

select departments.dept_no, departments.dept_name, dept_manager.emp_no, employee.last_name, employee.first_name from departments 
join dept_manager on departments.dept_no = dept_manager.dept_no 
join employee on dept_manager.emp_no = employee.emp_no 
order by departments.dept_no;

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

select departments.dept_no, departments.dept_name, employee.emp_no, employee.last_name, employee.first_name from employee 
join dept_emp on employee.emp_no = dept_emp.emp_no 
join departments on dept_emp.dept_no = departments.dept_no
order by employee.emp_no;

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select  employee.last_name, employee.first_name, employee.sex from employee 
where first_name = 'Hercules' and last_name like 'B%'
order by employee.last_name;

--6 List each employee in the Sales department, including their employee number, last name, and first name.
select departments.dept_no, departments.dept_name, employee.emp_no, employee.last_name, employee.first_name from departments 
join dept_emp on departments.dept_no = dept_emp.dept_no 
join employee on dept_emp.emp_no = employee.emp_no 
where departments.dept_name like 'Sales%'
order by employee.emp_no;


--7 List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select departments.dept_no, departments.dept_name, employee.emp_no, employee.last_name, employee.first_name from departments 
join dept_emp on departments.dept_no = dept_emp.dept_no 
join employee on dept_emp.emp_no = employee.emp_no 
where departments.dept_name like 'Sales%' or  departments.dept_name like 'Development%'
order by employee.emp_no;

--8 List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

select employee.last_name, count(employee.emp_no) from employee group by employee.last_name order by count(employee.emp_no) desc;
