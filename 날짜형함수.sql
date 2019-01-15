select curdate(),current_date; 
select curtime(),current_time();
select now(),sysdate();

-- 퀴리 시작하기전에 시간을 잡고 그뒤로 안바뀜
select emp_no,now() from employees;

-- 출력할때 시간을 잡기 때문에 긴 실행쿼리를 실행하면 테이블에 서로 다른 시간값이 들어갈수 있음
select emp_no,sysdate() from employees;

-- 포맷팅

select first_name,date_format(hire_date,'%Y년 %m월 %d일 %h:%i:%s') from employees;
select date_format(sysdate(),'%Y년 %m월 %d일 %h:%i:%s');


-- 각 직원들에 대헤 직원의 이름과 근무 개월수 period_diff() 두 date의 차이
select first_name,concat(cast(period_diff(date_format(curdate(),'%Y%m'),
date_format(hire_date,'%Y%m'))as char),'개월') from employees;


-- 입사 후 6개월 뒤에 정규직으로 발령이 된다 발령날은 언제인가?
-- month,week,year,day 가능
select first_name,hire_date,date_add(hire_date, interval 6 month) as '정규직 발령날' from employees
;
select date_add(cast(date_format('19940509','%Y%m%d') as DATE),interval 10000 day);
select date_add(cast('1991-01-16' as DATE),interval 10000 day);
