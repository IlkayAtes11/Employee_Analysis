-- DATA ENGINEERING

-- creating 'titles' table in employees_db
CREATE TABLE titles (
  title_id VARCHAR(5) NOT NULL PRIMARY KEY,
  title VARCHAR(300) NOT NULL
);

-- creating 'employees' table in employees_db
CREATE TABLE employees (
  emp_no INTEGER NOT NULL PRIMARY KEY,
  emp_title_id varchar(5) NOT NULL,
  birth_date DATE NOT NULL,
  first_name VARCHAR(300) NOT NULL,
  last_name VARCHAR(300) NOT NULL,
  sex VARCHAR(300) NOT NULL,
  hire_date DATE NOT NULL,
  FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- creating 'salaries' table in employees_db
CREATE TABLE salaries (
  emp_no INTEGER NOT NULL,
  salary INTEGER NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- creating 'departments' table in employees_db
CREATE TABLE departments (
  dept_no VARCHAR(300) NOT NULL PRIMARY KEY,
  dept_name VARCHAR(300) NOT NULL
);

-- creating 'dept_manager' table in employees_db
CREATE TABLE dept_manager (
  dept_no VARCHAR(300) NOT NULL,
  emp_no INTEGER NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- creating 'dept_emp' table in employees_db
CREATE TABLE dept_emp (
  emp_no INTEGER NOT NULL,
  dept_no VARCHAR(300) NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Data from csv files are imported to corresponding postgresql tables by using import/export function 






