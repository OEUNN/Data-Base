--null 처리 함수
--null은 연산을하면 값이 null이다.
select 10+null from dual;
select (salary*12) + (commission_pct*salary) from employees;

--nvl
--1번이 null이면 0 return
select 10+nvl(null,0) from dual;
select (salary*12)+(nvl(commission_pct,0)*salary) from employees;

--nvl2
--1번값이 not null이면 두번째, null이면 3번째
select salary*12+nvl2(commission_pct,commission_pct*salary,0)
from employees;





