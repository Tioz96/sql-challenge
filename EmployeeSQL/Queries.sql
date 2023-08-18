-- List the employee number, last name, first name, sex, and salary of each employee
SELECT E.emp_no, E.last_name, E.first_name, E.sex, S.salary
FROM "employees" E
JOIN "salaries" S ON E.emp_no = S.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM "employees"
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)
SELECT
    DM.dept_no,
    D.dept_name,
    DM.emp_no AS manager_emp_no,
    E.last_name AS manager_last_name,
    E.first_name AS manager_first_name
FROM "dept_manager" DM
JOIN "employees" E ON DM.emp_no = E.emp_no
JOIN "departments" D ON DM.dept_no = D.dept_no;


-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)
SELECT
    DE.emp_no,
    E.last_name,
    E.first_name,
    D.dept_no,
    D.dept_name
FROM "dept_emp" DE
JOIN "employees" E ON DE.emp_no = E.emp_no
JOIN "departments" D ON DE.dept_no = D.dept_no;


-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)
SELECT first_name, last_name, sex
FROM "employees"
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


-- List each employee in the Sales department, including their employee number, last name, and first name (2 points)
SELECT E.emp_no, E.last_name, E.first_name
FROM "employees" E
JOIN "dept_emp" DE ON E.emp_no = DE.emp_no
JOIN "departments" D ON DE.dept_no = D.dept_no
WHERE D.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)
SELECT E.emp_no, E.last_name, E.first_name, D.dept_name
FROM "employees" E
JOIN "dept_emp" DE ON E.emp_no = DE.emp_no
JOIN "departments" D ON DE.dept_no = D.dept_no
WHERE D.dept_name IN ('Sales', 'Development');


-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)
SELECT last_name, COUNT(*) AS frequency
FROM "employees"
GROUP BY last_name
ORDER BY frequency DESC;
