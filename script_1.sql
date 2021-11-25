USE employees;
SELECT first_name, last_name
FROM employees;

SELECT * FROM employees
WHERE first_name = 'Sanjiv' and gender = 'M';

SELECT dept_no FROM departments;
SELECT * FROM departments;

SELECT * FROM employees
WHERE first_name = 'Kellie' OR first_name = 'Aruna' ;

SELECT * FROM employees
WHERE first_name IN ('Denis', 'Elvis');

SELECT * FROM employees
WHERE first_name NOT IN ('John', 'Mark', 'Jacob');

SELECT * from employees
WHERE first_name LIKE ('Mark%');

SELECT * FROM employees
WHERE hire_date LIKE ('2000%');

SELECT * FROM employees
WHERE emp_no LIKE ('1000_');

SELECT * FROM employees
WHERE first_name LIKE ('%Jack%');

SELECT * FROM employees
WHERE first_name NOT LIKE ('%Jack%');

SELECT * FROM salaries;

SELECT * FROM salaries
WHERE salary BETWEEN '66000' AND '77000';

SELECT * FROM employees
WHERE emp_no NOT BETWEEN '10004' AND '10012';

SELECT * FROM departments
WHERE dept_no BETWEEN 'd003' AND 'd006';

SELECT * FROM departments
WHERE dept_no IS NOT NULL;

SELECT * FROM employees
WHERE gender = 'F' AND hire_date >= '2000-01-01';

SELECT * FROM salaries
WHERE salary > '150000';

SELECT DISTINCT
    hire_date
FROM
    employees;

SELECT 
    COUNT(*)
FROM
    salaries
WHERE
    salary >= '100000';

SELECT 
    COUNT(*)
FROM
    titles
WHERE
    title LIKE ('%manager%');
    
SELECT 
    COUNT(*)
FROM
    dept_manager;

SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;

SELECT 
    first_name, COUNT(first_name)
FROM
    employees
WHERE
    first_name LIKE ('%am')
GROUP BY first_name
ORDER BY first_name DESC;

SELECT 
    salary, COUNT(emp_no) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > '80000'
GROUP BY salary
ORDER BY salary;

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY names_count DESC;

SELECT 
    *, AVG(salary) as avg_salary
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;

SELECT 
    *, AVG(salary) as avg_salary
FROM
    salaries
WHERE
    salary > '120000'
GROUP BY emp_no
ORDER BY emp_no;

/* This code returns total number of employees born on each day in the DB */
SELECT
    birth_date, COUNT(*)
FROM
    employees
GROUP BY birth_date
ORDER BY birth_date;

SELECT 
    emp_no, COUNT(emp_no) AS hire_time
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(emp_no) > 1;

SELECT 
    emp_no
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;

SELECT 
    *
FROM
    dept_emp
LIMIT 100;

SELECT 
    COUNT( DISTINCT dept_no)
FROM
    dept_emp;

SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
SELECT 
    MAX(emp_no)
FROM
    employees;


SELECT 
    MIN(emp_no)
FROM
    employees;
    
/* average annual salary paid to employees after 199-01-01 */
SELECT 
    ROUND(AVG(salary),2)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    