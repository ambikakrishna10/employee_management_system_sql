use mydatabase;

create table department(
dept_id int,
dept_name varchar(30) unique,
primary key(dept_id)
);


create table employee(
emp_id int,
emp_name varchar(30) not null,
salary decimal(10,2),
city varchar(50),
dept_id int,
foreign key(dept_id) references department(dept_id)
);


insert into department values(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

select * from department;


insert into employee values(101,'Ravi',50000,'Hyderabad',1),
(102,'Hari',45000,'Bangalore',2),
(103,'Suri',60000,'Chennai',3),
(104,'Ramu',55000,'Hyderabad',1),
(105,'Kiran',45000,'Pune',2);

select * from employee;


select emp_name from employee;
select emp_id, emp_name from employee;
select emp_name, salary from employee;
select emp_id, emp_name, city from employee;
select emp_id, emp_name, salary from employee;


select * from employee order by emp_id desc;
select * from employee order by salary asc;
select * from employee order by salary desc;


select * from employee where emp_id = 103;
select * from employee where city = 'Hyderabad';
select * from employee where city = 'Bangalore';


select distinct city from employee;
select distinct dept_id from employee;


select * from employee order by salary desc limit 2;
select * from employee order by salary desc limit 3;


SET SQL_SAFE_UPDATES = 0;
update employee set salary = 65000 where emp_id = 101;
set sql_safe_updates = 1;


delete from employee where emp_id = 105;

alter table employee add email varchar(100);

alter table employee rename column city to location;


start transaction;

update employee set salary = 70000 where emp_id = 101;
savepoint p1;

update employee set salary = 80000 where emp_id = 102;
savepoint p2;

rollback to p2;
rollback to p1;

commit;
