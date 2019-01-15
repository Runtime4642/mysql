-- 문제1

select max(salary) as 최고임금,min(salary) as 최저임금,(max(salary)-min(salary)) as '최고임금-최저임금' from salaries ;

-- 문제2
select date_format(max(hire_date),'%Y년 %m월 %d일') from employees;

-- 문제3
select date_format(min(hire_date),'%Y년 %m월 %d일') from employees;

-- 문제4

select avg(salary) as 평균연봉 from salaries;	 

-- 문제5 
select max(salary) as 최고연봉,min(salary) as 최소연봉  from salaries;	 


-- 문제6 period 방식
select floor(period_diff(date_format(curdate(),'%Y%m'),date_format(max(birth_date),'%Y%m'))/12) 
 as '최고 어린 사원의 나이' 
,floor(period_diff(date_format(curdate(),'%Y%m'),date_format(min(birth_date),'%Y%m'))/12) 
as'최 연장자의 나이' from employees ;

-- 문제6 그냥 년으로만 가지고 뺌.
select date_format(curdate(),'%Y')-date_format(max(birth_date),'%Y') as '최고 어린 사원의 나이' ,date_format(curdate(),'%Y')-date_format(min(birth_date),'%Y') as '최 연장자의 나이'from employees;

