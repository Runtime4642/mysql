
-- 문제1.
-- 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?
	select count(*)
    from employees a,salaries b 
    where a.emp_no = b.emp_no
    and b.to_date='9999-01-01'
    and salary >any
    (select avg(salary) 
    from salaries 
    where to_date='9999-01-01');

-- 문제2. 
-- 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 연봉을 조회하세요. 단 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다. 
	select concat(a.first_name,' ',a.last_name) as 이름
	, a.emp_no as 사번 ,
    d.salary as 연봉
	from employees a,dept_emp b,departments c, salaries d
    where d.to_date='9999-01-01'
    and b.to_date='9999-01-01'
    and a.emp_no=b.emp_no
    and d.emp_no=a.emp_no
    and c.dept_no = b.dept_no
    and (c.dept_no,d.salary) in
	(select c.dept_no as 부서이름,
	max(d.salary) as 연봉 
	from employees a,dept_emp b,departments c, salaries d
    where d.to_date='9999-01-01'
    and b.to_date='9999-01-01'
    and a.emp_no=b.emp_no
    and d.emp_no=a.emp_no
    and c.dept_no = b.dept_no
    group by c.dept_no)
	order by 연봉 desc;
    
    
   
-- 문제3.
-- 현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 연봉을 조회하세요 
	select a.emp_no as 사번
    ,concat(a.first_name,' ',a.last_name) as 이름,
    b.salary as 연봉
    from employees a,salaries b
    where  a.emp_no=b.emp_no
    and b.to_date ='9999-01-01'
    and b.salary > any
    (select avg(d.salary)
    from employees a,dept_emp b,departments c, salaries d
    where d.to_date='9999-01-01'
    and b.to_date='9999-01-01'
    and a.emp_no=b.emp_no
    and d.emp_no=a.emp_no
    and c.dept_no = b.dept_no
    group by c.dept_no);

	
-- 문제4.
-- 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.

	select a.사번,a.사원이름,concat(b.first_name,' ',b.last_name) as 매니저이름,
    a.부서이름    
    from
    (select concat(a.first_name,' ',a.last_name) as 사원이름,
	a.emp_no as 사번,
     d.매니저 as 매니저,
     c.dept_name as 부서이름
    from employees a, dept_emp b, departments c ,(select a.dept_no as 부서,b.emp_no as 매니저 from departments a , dept_manager b 
															where b.to_date = '9999-01-01') d
    where a.emp_no = b.emp_no
    and b.to_date='9999-01-01'
    and c.dept_no=b.dept_no
    and c.dept_no = d.부서) a,employees b
    where a.매니저=b.emp_no;
    
    select a.dept_no as 부서,b.emp_no as 매니저 from departments a , dept_manager b 
															where b.to_date = '9999-01-01';
    
-- 문제5.
-- 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.

	select concat(a.first_name,' ',a.last_name) as 사원이름,
    a.emp_no as 사번,
    f.title as 직책,
    d.salary as 연봉
    from employees a,dept_emp b,departments c, salaries d ,  (select avg(d.salary),c.dept_no as 부서번호
    from employees a,dept_emp b,departments c, salaries d
    where d.to_date='9999-01-01'
    and b.to_date='9999-01-01'
    and a.emp_no=b.emp_no
    and d.emp_no=a.emp_no
    and c.dept_no = b.dept_no
    group by c.dept_no
    limit 0,1) e, titles f
    where d.to_date='9999-01-01'
    and b.to_date='9999-01-01'
    and a.emp_no=b.emp_no
    and d.emp_no=a.emp_no
    and c.dept_no = b.dept_no
    and e.부서번호=c.dept_no
    and f.to_date='9999-01-01'
    and f.emp_no=a.emp_no
    order by d.salary desc;
    
    
    

-- 문제6.
-- 평균 연봉이 가장 높은 부서는? 
	select c.dept_name
    from employees a,dept_emp b,departments c, salaries d
    where d.to_date='9999-01-01'
    and b.to_date='9999-01-01'
    and a.emp_no=b.emp_no
    and d.emp_no=a.emp_no
    and c.dept_no = b.dept_no
    group by c.dept_no
    order by avg(d.salary) desc
	limit 0,1;

	 
-- 문제7.
-- 평균 연봉이 가장 높은 직책?
	select b.title
    from employees a,titles b, salaries c
    where b.to_date='9999-01-01'
    and c.to_date='9999-01-01'
    and a.emp_no=b.emp_no
    and b.emp_no=c.emp_no
    group by b.title
    order by avg(c.salary) desc
	limit 0,1;




-- 문제8.
-- 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.
	
	select a.부서이름,a.사원이름,a.연봉,concat(b.first_name,' ',b.last_name) as 매니저이름,
    a.매니저연봉
    from 
  (select c.dept_name as 부서이름,
  a.사원이름,
  b.salary as 연봉,
  a.매니저,
  a.매니저연봉 
  from   
  (select a.emp_no as 사번,
	concat(a.first_name,' ',a.last_name) as 사원이름 ,	
     d.매니저 as 매니저,
     e.salary as 매니저연봉
    from employees a, dept_emp b, departments c ,
    (select a.dept_no as 부서,b.emp_no as 매니저
    from departments a , dept_manager b 
	where b.to_date = '9999-01-01'
    and a.dept_no=b.dept_no) d , salaries e
    where a.emp_no = b.emp_no
    and b.to_date='9999-01-01'
    and c.dept_no=b.dept_no
    and c.dept_no = d.부서
    and e.to_date = '9999-01-01'
    and e.emp_no = d.매니저) a ,salaries b , departments c, dept_emp d
    
    where b.to_date='9999-01-01'
    and a.사번=b.emp_no
    and a.매니저연봉 < b.salary
    and d.to_date='9999-01-01'
    and c.dept_no=d.dept_no
    and d.emp_no=a.사번) a, employees b
    where a.매니저 = b.emp_no;
