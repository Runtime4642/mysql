select abs(10), abs(-10); -- 절대값 
select mod(234,10), 254 %10; -- 나머지
select floor(1.23), floor(-1.23); -- 1, -2 출력 x보다 크지않은 가장 큰 정수
select ceil(3.14),ceiling(3.14),ceil(-3.14),ceiling(-3.14); -- x보다 작지않은 가장 작은 정수
select round(-1.23); -- x에 가장 근접한 정수 (반올림)
select round(-1.5);
select pow(2,2); -- x의 y 제급근
select sign(-10); -- 음수이면 01 0이면 0 양수이면 1을 반환
select greatest(10,30,1.5,30.2); -- 가장 큰값 반환
select least("aza","zax","aaa","a","b"); -- 가장 작은 값 반환


