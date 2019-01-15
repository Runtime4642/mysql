-- 문제1

select concat(first_name,' ',last_name) as 이름 from employees where emp_no='10944';


-- 문제2
select concat(first_name,' ',last_name) as 이름,gender as 성별 ,hire_date as 입사일 from employees order by hire_date;

-- 문제3
select count(*)  from employees group by gender;

-- 문제4 
select count(*) from employees;

-- 문제5
select count(*) from departments;

-- 문제6 확인해봐야함
select count(distinct dept_no) from dept_manager;

-- 문제7
select dept_name from departments order by length(dept_name) desc;

-- 문제8 --확인해봐야함
select count(distinct emp_no) from salaries where salary>=120000;

-- 문제9
select distinct title from titles order by length(title) desc;

-- 문제10
select count(*) from titles where title ='Engineer';

-- 문제11
select * from titles where emp_no=13250 order by to_date asc;


