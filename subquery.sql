

-- subquery
select b.dept_no
	from employees a, dept_emp b 
    where a.emp_no = b.emp_no
	and concat(a.first_name,' ',a.last_name)='Fai Bale'
	and b.to_date = '9999-01-01';
    
    
    -- 행을 맞춰주어도 됨  (a.emp_no,b.dept_no) = (select a.emp_no,b.dept_no ...)
select a.emp_no,b.dept_no
	from employees a, dept_emp b 
    where a.emp_no = b.emp_no
	and b.dept_no = (select b.dept_no
	from employees a, dept_emp b 
    where a.emp_no = b.emp_no
	and concat(a.first_name,' ',a.last_name)='Fai Bale'
	and b.to_date = '9999-01-01');
    
    -- 실습문제
    
    -- 실습문제 1
      select concat(a.first_name,' ',a.last_name) as 이름,b.salary from employees a,salaries b
		where a.emp_no = b.emp_no
        and b.to_date='9999-01-01'
        and b.salary < (select avg(salary) from salaries where to_date='9999-01-01')
        order by b.salary desc;

    -- 실습문제 2
    
    select min(avg_salary) from(
    select b.title as 부서, round(avg(a.salary)) as avg_salary from salaries a,titles b
    where a.emp_no=b.emp_no
    and a.to_date='9999-01-01'
	and b.to_date='9999-01-01'
     group by title) a;
     
     
     -- 부서와 최저평균 모두 출력
    select b.title as 부서, round(avg(a.salary)) as avg_salary from salaries a,titles b
    where a.emp_no=b.emp_no
    and a.to_date='9999-01-01'
	and b.to_date='9999-01-01'
     group by title
     having avg_salary = ( select min(avg_salary) from(
    select b.title as 부서, round(avg(a.salary)) as avg_salary from salaries a,titles b
    where a.emp_no=b.emp_no
    and a.to_date='9999-01-01'
	and b.to_date='9999-01-01'
       group by title) a);

    
    
    