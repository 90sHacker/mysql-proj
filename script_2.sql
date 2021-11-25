# dept_manager_dup
select * from dept_manager_dup order by dept_no;

SELECT 
	m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

SELECT 
    e.emp_no, d.dept_no, e.first_name, e.last_name, e.hire_date
FROM
    employees e
        JOIN
    dept_manager d ON e.emp_no = d.emp_no
ORDER BY emp_no;

SELECT 
    e.emp_no, e.first_name, e.last_name, d.dept_no, d.from_date
FROM
    employees e
        LEFT JOIN
    dept_manager d ON e.emp_no = d.emp_no
WHERE
    e.last_name = 'Markovitch'
ORDER BY d.dept_no DESC , e.emp_no;

/* old join syntax */
SELECT 
    e.emp_no, e.first_name, e.last_name, e.hire_date, d.dept_no
FROM
    employees e,
    dept_manager d
WHERE
    e.emp_no = d.emp_no
ORDER BY emp_no;

SELECT 
    e.emp_no, e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    e.first_name = 'Margareta'
        AND e.last_name = 'Markovitch'
ORDER BY emp_no;

SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
WHERE
    d.dept_no = 'd009'
order by dept_name;

SELECT 
    e.*, d.*
FROM
    employees e
        CROSS JOIN
    departments d
WHERE
    e.emp_no < 10011
ORDER BY e.emp_no , d.dept_no;

# retrieve all managers full names, hire date, title and dept name soln1
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
	dm.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
        JOIN
	dept_manager dm on t.emp_no = dm.emp_no
		JOIN
	departments d ON dm.dept_no = d.dept_no
WHERE t.title = 'Manager'
ORDER BY dept_name;

# retrieve all managers full names, hire date, title and dept name soln2
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    dm.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
        JOIN
    departments d ON dm.dept_no = d.dept_no
        JOIN
    titles t ON e.emp_no = t.emp_no
        AND dm.from_date = t.from_date
	ORDER BY dept_name;
    
    # how many male and female managers are in the database?
    SELECT 
    e.gender, COUNT(*) AS amount
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY gender;

SELECT 
    *
FROM
    (SELECT 
        e.emp_no,
            e.first_name,
            e.last_name,
            NULL AS dept_no,
            NULL AS from_date
    FROM
        employees e
    WHERE
        last_name = 'Denis' UNION SELECT 
        NULL AS emp_no, 
			NULL AS first_name, 
            NULL AS last_name,
			dm.dept_no, 
			dm.from_date
    FROM
        dept_manager dm) AS a
ORDER BY -a.emp_no DESC;

# managers hired between Jan 1990 & Jan 1995 join soln
SELECT 
    e.*, dm.dept_no, dm.from_date, dm.to_date
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
WHERE
    e.hire_date BETWEEN '1990-01-01' AND '1995-01-01'
ORDER BY e.emp_no;

# soln2
SELECT 
    e.first_name, e.last_name, e.hire_date
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm)
HAVING e.hire_date BETWEEN '1990-01-01' AND '1995-01-01'
ORDER BY hire_date ASC;

#soln3
SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');