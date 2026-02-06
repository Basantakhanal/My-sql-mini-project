create database basantadb;
use basantadb;
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100),
    location VARCHAR(100)
);
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    contact VARCHAR(15),
    position VARCHAR(50),
    salary DECIMAL(10,2),
    dept_id INT,
	FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    budget DECIMAL(10,2)
);
CREATE TABLE employee_projects (
    ep_id INT ,
    emp_id INT,
    project_id INT,
    role VARCHAR(50),
    assigned_date DATE,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);
show tables;
drop table departments;
drop table employees;
drop table projects;
drop table employee_projects;
INSERT INTO departments (dept_id,dept_name,location)
 VALUES
(1, ' Human Resources Department', 'Building A'),
(2, 'IT Department', 'Building B'),
(3, 'Finance Department', 'Building C'),
(4, 'Web Department', 'Building d');
INSERT INTO employees (emp_id,emp_name,email,contact,position,salary,dept_id)
VALUES
(101, 'Ramesh Thapa', 'ramesh@company.com', '9841000001', 'Manager', 60000.00, 1),
(102, 'Sita Sharma', 'sita@company.com', '9841000002', 'Developer', 45000.00, 2),
(103, 'Binod Singh', 'binod@company.com', '9841000003', 'Accountant', 40000.00, 3),
(104, 'Priya Lama', 'priya@company.com', '9841000004', 'HR Assistant', 35000.00, 1),
(105, 'Saugat Thakuri','saugat@company.com','9841202365','Developer',45000,4);
INSERT INTO projects (project_id,project_name,start_date,end_date,budget)
VALUES
(201, 'Web Portal System', '2023-01-01', '2023-06-01', 200000.00),
(202, 'Mobile App Development', '2023-03-05', NULL, 300000.00),
(203, 'Payroll Automation', '2022-10-10', '2023-02-15', 150000.00),
(204, 'Animation', '2020-9-11', '2023-06-19', 250000.00),
(205, 'Route Hive', '2024-10-28', NULL, 150000.00);
INSERT INTO employee_projects (ep_id,emp_id,project_id,role,assigned_date)
VALUES
(1, 102, 201, 'Backend Developer', '2023-01-02'),
(2, 102, 202, 'Mobile Developer', '2023-03-06'),
(3, 101, 203, 'Project Manager', '2022-10-11'),
(4, 103, 203, 'Finance Analyst', '2022-10-12'),
(5, 104, 203, 'Frontend Developer', '2024-5-4');
SELECT emp_name, email,contact
FROM employees
WHERE salary < 809999;
SELECT dept_id,dept_name,location
FROM departments;
SELECT MIN(Salary) as MinimumSalary FROM employees;
ALTER TABLE employees ADD PRIMARY KEY(emp_id);
DESC employees;
INSERT INTO employees(emp_id, emp_name,email,contact,position,salary,dept_id) 
VALUES
('106','Laxman Acharya','laxman@company.com','9841203561','HR',900000,3);
INSERT INTO employees(emp_id, emp_name,email,contact,position,salary,dept_id) 
VALUES
('201','sudeep karn','sudeep@company.com','9841203561','HR',900000,3);
DELETE FROM employees
WHERE emp_id = 106;

UPDATE departments SET dept_name='information and technology',location='Buildind B';
ALTER TABLE employees MODIFY salary decimal(20,6);
SELECT MIN(Salary) as MinimumSalary FROM employees;
select * from departments;
select * from employees;
select*from projects;
-- lab 2 assignmnet


select * from departments where dept_id=1;
select emp_name as name from employees
union
select project_name as name from projects;
select project_id as id from projects
intersect
select emp_id as id from employees;
select employees.emp_name,employee_projects.assigned_date
from employees
join employee_projects on employees.emp_id=employee_projects.emp_id;
SELECT emp_name FROM employees
EXCEPT
SELECT employees.emp_name
FROM employees
JOIN employee_projects
ON employees.emp_id = employee_projects.emp_id;

SELECT departments.dept_id,departments.dept_name,employees.emp_id,employees.emp_name
FROM employees
RIGHT JOIN departments
ON employees.dept_id = departments.dept_id;
SELECT departments.dept_id,departments.dept_name,employees.emp_id,employees.emp_name
FROM departments
LEFT JOIN employees
ON employees.dept_id = departments.dept_id;
SELECT employees.emp_id,employees.emp_name,employees.position,departments.dept_name,departments.location
FROM employees
INNER JOIN departments
ON employees.dept_id = departments.dept_id;
SELECT employees.emp_name,projects.project_name,employee_projects.role,employee_projects.assigned_date
FROM employee_projects
INNER JOIN employees
ON employee_projects.emp_id = employees.emp_id
INNER JOIN projects
ON employee_projects.project_id = projects.project_id;


    
















