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

-- DATA ANALYSIS

-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
INNER JOIN salaries as s ON
e.emp_no=s.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '01/01/1986' and  hire_date <= '12/31/1986'

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name, e.hire_date
FROM employees as e
INNER JOIN dept_manager as dm ON
e.emp_no=dm.emp_no
INNER JOIN departments as d ON
dm.dept_no=d.dept_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

-- List each employee in the Sales department, including their employee number, last name, and first name.

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).




