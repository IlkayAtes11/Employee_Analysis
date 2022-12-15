## Employee Analysis of Pewlett Hackard

Employee analysis of Pewlett Hackard has been conducted in three phases:
*Data Modelling
*Data Engineering 
*Data Analysis

Data from the company has six different related tables. 

### Data Modelling

On Data Modelling phase, QuickDBD (https://www.quickdatabasediagrams.com/) was used to sketch the Entity Relationship Diagram (ERD) of the tables OF Pewlett Hackard`s data.

![ERD](./images/ERD.png)

### Data Engineering

Then, on data engineering phase, the table schema for each of the six CSV files was created. While creating table schema, primary keys, foreign keys, type of the data and other constraints were specified.[table_shemata](https://github.com/IlkayAtes11/SQL_Challenge/blob/main/code/table%20schemata.sql)

After creating tables, data from csv file was imported to corresponding table, using Postgresql`s import/export function. 

### Data Analysis

Lastly, on data analysis part, codes were written in PgAdmin to answer below questions.

1. List the employee number, last name, first name, sex, and salary of each employee.

```
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
INNER JOIN salaries as s ON
e.emp_no=s.emp_no;
```

2. List the first name, last name, and hire date for the employees who were hired in 1986.

```
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '01/01/1986' and  hire_date <= '12/31/1986'
```

3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

```
SELECT dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name, e.hire_date
FROM employees as e
INNER JOIN dept_manager as dm ON
e.emp_no=dm.emp_no
INNER JOIN departments as d ON
dm.dept_no=d.dept_no;
```

4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

```
SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp as de ON
e.emp_no=de.emp_no
INNER JOIN departments as d ON
de.dept_no=d.dept_no;
```

5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

```
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%'
```

6. List each employee in the Sales department, including their employee number, last name, and first name.

```
SELECT e.emp_no, e.last_name, e.first_name
FROM employees as e
INNER JOIN dept_emp as de ON
e.emp_no=de.emp_no
INNER JOIN departments as d ON
de.dept_no=d.dept_no
WHERE dept_name = 'Sales'
```

7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

```
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp as de ON
e.emp_no=de.emp_no
INNER JOIN departments as d ON
de.dept_no=d.dept_no
WHERE dept_name = 'Sales' or dept_name = 'Development'
```

8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

```
SELECT last_name, COUNT(last_name) AS last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC
```