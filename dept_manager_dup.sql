DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (
	emp_no int(11) not null,
    dept_no char(4) null,
    from_date date not null,
    to_date date null
);

insert into dept_manager_dup select * from dept_manager;

insert into dept_manager_dup (emp_no, from_date)
values	(999904, '2017-01-01'),
		(999905, '2017-01-01'),
        (999906, '2017-01-01'),
        (999907, '2017-01-01');
        
DELETE FROM dept_manager_dup 
WHERE
    dept_no = 'd001';