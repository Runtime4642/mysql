-- MySQL 뮨자열 함수

select ucase('Seoul'), upper('seoul');
select lcase('Seoul'), lower('SEOUL');

-- from 을 붙여주지 않으면 버전이나 종류에 따라 오류 날수 있음.
select substring('Happy',3,2) from dual;

select substring(first_name,3,2) from employees;



-- 남은 크기를 뒷문자로 채움 
select LPAD('hi',10,'*') from dual; -- 왼쪽에채움
select RPAD('hi',10,'*'); -- 오른쪽에 채움

-- 숫자에 쓸때는 cast를 사용해서 char 형변환
select emp_no,LPAD(cast(salary as char),10,'*') from salaries;

-- 공백 없애기 왼쪽,오른쪽
select ltrim(' hello    '), rtrim('    hello   ');
select concat('---',ltrim('   hello    '),'---'),concat('---',rtrim('   hello    '),'---');
select concat('---',trim('   hello    '),'---');
		
-- 문자 없애기
select trim(both 'x' from 'xxxxhixxxx');
select trim(leading 'x' from 'xxxxhixxxx');  -- 왼쪽없애기
select trim(trailing 'x' from 'xxxxhixxxx');  -- 오른쪽 없애기

