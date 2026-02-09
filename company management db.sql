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
(1, ' Human Resources Department', 'Building A');

INSERT INTO employees (emp_id,emp_name,email,contact,position,salary,dept_id)
VALUES
(1, 'Ramesh Thapa', 'ramesh@company.com', '9841000001', 'Manager', 60000.00, 1);

INSERT INTO projects (project_id,project_name,start_date,end_date,budget)
VALUES
(1, 'Web Portal System', '2023-01-01', '2023-06-01', 200000.00);

INSERT INTO employee_projects (ep_id,emp_id,project_id,role,assigned_date)
VALUES
(1, 102, 201, 'Backend Developer', '2023-01-02');

select *from employee_projects;
select*from projects;
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
intersect;
select emp_id as id from employees;
select employees.emp_name,employee_projects.assigned_date
from employees
join employee_projects on employees.emp_id=employee_projects.emp_id;

select employees.emp_name,employee_projects.ep_id
from employees
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
show tables;
SET SQL_SAFE_UPDATES = 0;

-- transcation 
START TRANSACTION;
INSERT INTO employees(emp_id, emp_name, email, contact, position, salary, dept_id)
VALUES (99, 'Amit Shrestha', 'amit@company.com', '9841111111', 'Developer', 50000, 2);
COMMIT;
START TRANSACTION;
INSERT INTO employees(emp_id, emp_name, email, contact, position, salary, dept_id)
VALUES (202, 'Wrong Person', 'wrong@company.com', '9800000000', 'Tester', 40000, 3);
ROLLBACK;

START TRANSACTION;
UPDATE employees
SET salary = salary + 500000
WHERE emp_id = 103;
COMMIT;

select* from departments where dept_id=1;

-- unf

CREATE TABLE employees_unfs (
    emp_id INT,
    emp_name VARCHAR(100),
    email VARCHAR(100),
    contact VARCHAR(100),
    position VARCHAR(50),
    salary DECIMAL(10,2),
    dept_info VARCHAR(100)
);

INSERT INTO employees_unfs VALUES
(989, "Suman Giri", "suman12@gmail.com","9841202156,985212345", "Developer", 55000, "1-IT"),
(101, "Ramesh Thapa", "ramesh@company.com","9841000001,9745693120", "Manager", 60000, "1-IT");

SELECT * FROM employees_unfs;

-- 1 nf

CREATE TABLE employees_1nfs (
    emp_id INT,
    emp_name VARCHAR(100),
    email VARCHAR(100),
    contact1 VARCHAR(15),
    contact2 VARCHAR(15),
    position VARCHAR(50),
    salary DECIMAL(10,2),
    dept_info VARCHAR(100)
);

INSERT INTO employees_1nfs VALUES
(989, "Suman Giri", "suman12@gmail.com",
 "9841202156", "985212345", "Developer", 55000, "1-IT"),

(101, "Ramesh Thapa", "ramesh@company.com",
 "9841000001", "9745693120", "Manager", 60000, "1-IT");

SELECT * FROM employees_1nfs;

-- 2nf

CREATE TABLE employees_2nfs (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    email VARCHAR(100),
    position VARCHAR(50),
    salary DECIMAL(10,2),
    dept_id INT
);

CREATE TABLE employee_contacts_2nfs (
    emp_id INT PRIMARY KEY,
    contact1 VARCHAR(15),
    contact2 VARCHAR(15)
);

INSERT INTO employees_2nfs VALUES
(989, "Suman Giri", "suman12@gmail.com", "Developer", 55000, 1),
(101, "Ramesh Thapa", "ramesh@company.com", "Manager", 60000, 1);

INSERT INTO employee_contacts_2nfs VALUES
(989, "9841202156", "985212345"),
(101, "9841000001", "9745693120");

SELECT * FROM employees_2nfs;
SELECT * FROM employee_contacts_2nfs;


-- 3-nf

CREATE TABLE departments_3nfs (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);

INSERT INTO departments_3nfs VALUES
(1, "IT"),
(2, "Finance"),
(3, "HR");


CREATE TABLE employees_3nfs (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    email VARCHAR(100),
    position VARCHAR(50),
    salary DECIMAL(10,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments_3nfs(dept_id)
);

INSERT INTO employees_3nfs VALUES
(989, "Suman Giri", "suman12@gmail.com", "Developer", 55000, 1),
(101, "Ramesh Thapa", "ramesh@company.com", "Manager", 60000, 1);


CREATE TABLE employee_contacts_3nfs (
    emp_id INT,
    contact_number VARCHAR(15),
    PRIMARY KEY(emp_id, contact_number),
    FOREIGN KEY (emp_id) REFERENCES employees_3nfs(emp_id)
);

INSERT INTO employee_contacts_3nfs VALUES
(989, "9841202156"),
(989, "985212345"),
(101, "9841000001"),
(101, "9745693120");


SELECT * FROM departments_3nfs;
SELECT * FROM employees_3nfs;
SELECT * FROM employee_contacts_3nfs;

show tables;
select departments.dept_name,employees.emp_name
from departments
join employees on departments.dept_id=employees.emp_id;

update employees set emp_id=1 where 
emp_name="rameshthapa";

select d.dept_name,e.emp_name,p.project_name
from departments d
inner join employees e
inner join projects p 
join employees on d.dept_id=e.emp_id=p.project_id;






    
















