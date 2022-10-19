--다중행 함수
--여러행을 하나의 값으로 산출
--sum
select sum(salary) from employees;

--count 
select count(employee_id) from employees;
--count는 null값을 count하지 않는다.(employee_id와 값이 다르다.)
select count(department_id) from employees;
--정확한 행 수를 알고 싶다면 *를 준다.
select count(*) from employees;

--max,min,avg 등등

