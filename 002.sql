-- 문제1

select max(salary) as 최고임금,min(salary) as 최저임금,(max(salary)-min(salary)) as '최고임금-최저임금' from salaries ;

-- 문제2
select date_format(max(hire_date),'%Y년 %m월 %d일') from employees;

-- 문제3
select date_format(min(hire_date),'%Y년 %m월 %d일') from employees;

-- 문제4
select * from salaries;
select max(금액) as 최고,min(금액) 최저 from(select max(from_date) as 날짜,max(salary) as 금액 from salaries group by emp_no) a;

-- 문제5 88958
select max(max) as 최고연봉,min(min) as 최저연봉 from (select max(salary) as max,min(salary) as min from salaries group by emp_no) a;
-- 문제6
select floor(period_diff(date_format(curdate(),'%Y%m'),date_format(max(birth_date),'%Y%m'))/12) 
 as '최고 어린 사원의 나이' 
,floor(period_diff(date_format(curdate(),'%Y%m'),date_format(min(birth_date),'%Y%m'))/12) 
as'최 연장자의 나이' from employees ;

