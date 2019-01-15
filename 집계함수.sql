-- 집계함수 (통계)

select avg(salary),sum(salary) from salaries where emp_no =10060;

select emp_no,avg(salary),sum(salary) from salaries group by emp_no;

select * from(select avg(salary),sum(salary) from salaries where emp_no =10060) a;


select emp_no,count(*) from titles;

select emp_no,avg(salary) from salaries group by emp_no having avg(salary) >10000;

