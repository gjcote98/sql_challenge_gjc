DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;


create table departments(
	dept_no	varchar(10),
	dept_name varchar(30),
	PRIMARY KEY(dept_no)
);

create table titles(
	title_id varchar(10),
	title varchar(30),
	PRIMARY KEY(title_id)
);

create table employees(
	emp_no int,
	emp_title_id varchar(30),
	birth_date date,
	first_name varchar(30),
	last_name varchar(30),
	sex varchar(1),
	hire_date date,
	PRIMARY KEY(emp_no),
	FOREIGN KEY(emp_title_id) REFERENCES titles (title_id)
);

create table dept_emp(
	emp_no int,
	dept_no varchar(10),
	PRIMARY KEY(dept_no,emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

create table dept_manager(
	dept_no varchar(10),
	emp_no int,
	PRIMARY KEY(dept_no,emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

create table salaries(
	emp_no int,
	salary int,
	PRIMARY KEY(emp_no),
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

select * from salaries;
select * from dept_manager;
select * from dept_emp;
select * from employees;
select * from titles;
select * from departments;


--1
Select emp_no, last_name, first_name, sex, salary
From employees, salaries
Where employees.emp_no=salaries.emp_no
;

--2
Select first_name, last_name, hire_date
From employees
Where hire_date >= '1986/01/01' and hire_date < '1987/01/01' 
;

--3
Select dept_manager.dept_no, dept_name, dept_manager.emp_no, last_name, first_name
From dept_manager, employees, departments
Where dept_manager.emp_no = employees.emp_no
and departments.dept_no=dept_manager.dept_no
;

--4
Select employees.emp_no, last_name, first_name, departments.dept_no, dept_name
From employees, departments, dept_emp
Where employees.emp_no=dept_emp.emp_no
And dept_emo.dept_no=departments.dept_no
;

--5
Select first_name, last_name, sex
From employees
Where first_name = 'Hercules'
And last_name like 'B%'
;

--6
Select employee.emp_no, last_name, first_name, dept_name
From employees, dept_emp, departments
Where employees.emp_no=dept_emp.emp_no
And dept_emp.dept_no=departments.dept_no
And dept_name = ‘Sales’
;

--7
Select employees.emp_no, last_name, first_name, dept_name
From employees, dept_emp, departments
Where employees.emp_no=dept_emp.emp_no
And dept_emp.dept_no=departments.dept_no
And dept_name in ('Sales', 'Development')
;

--8
Select last_name, count(last_name) as "No of Records"
From employees
Group by last_name
Order by "No of Records" desc
;


