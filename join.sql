

-- ANSI/ISO SQL의 join


-- 1. natural join 같은 이름을 찾아가서 조인 - 잘안씀

select a.emp_no, a.first_name, b.title
from employees a natural join titles b  
where b.to_date = '9999-01-01';

-- 2. join  ~using 이름을 명시 - 잘안씀

select a.emp_no, a.first_name, b.title
from employees a join titles b
using (emp_no)  
where b.to_date = '9999-01-01';

-- 3. join ~ on -잘안쓰고 그냥 where절에 명시를 많이함 

select a.emp_no, a.first_name, b.title
from employees a join titles b
on a.emp_no = b.emp_no  
where b.to_date = '9999-01-01';

-- equi join 실습문제
-- 실습문제1.
	select a.emp_no as 사번, concat(a.first_name,' ',a.last_name) as 이름 , c.dept_name as 부서
    from employees a,dept_emp b,departments c
    where a.emdp_no=b.emp_no and b.dept_no = c.dept_no and b.to_date = '9999-01-01';


-- 실습문제2.
select a.emp_no as 사번 ,concat(a.first_name,' ',a.last_name) as 이름 ,b.salary as 급여 
from employees a,salaries b 
where a.emp_no = b.emp_no and b.to_date = '9999-01-01'
order by concat(a.first_name,' ',a.last_name) asc;


