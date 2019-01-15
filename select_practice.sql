select *from employees;


-- concat colmun 의 값을 합친 것
select emp_no as '번호',
		concat(first_name,' ',
        last_name)as '이름',
        hire_date as '입사일'
from employees;

-- distinct 중복 배제 
select distinct title from titles;

select title,count(*) as 사원수 from titles group by title order by 사원수 desc;

select concat(first_name,' ',
        last_name) as '이름',
gender,hire_date
        from employees order by hire_date asc;

-- 2001년 월급을 가장 많이 받은사람 순으로 출력하시오
select *
from salaries
where from_date like '2001%' order by salary desc;


select first_name,gender,hire_date from employees where hire_date < '1991-01-01' and gender ='f'
;
select * from dept_emp where dept_no in ('d005','d009');

select hire_date,concat(first_name,' ',
        last_name) as '이름' from employees where hire_date like '1989-__-__' order by hire_date;
        

