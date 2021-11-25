drop table if exists departments_dup;

/*create new duplicate table*/
CREATE TABLE departments_dup (
    dept_no CHAR(4) NULL,
    dept_name VARCHAR(40) NULL
);

/*insert all records from original table into duplicate*/
insert into departments_dup (dept_no, dept_name) select * from departments;

/*insert new department name into duplicate table*/
insert into departments_dup(dept_name) values ('Public Relations');

/* delete from duplicate table, record that matches dept_no*/
DELETE FROM departments_dup 
WHERE
    dept_no = 'd002';
    
/*insert new dept_no into duplicate table*/
insert into departments_dup(dept_no) values('d010'),('d011');