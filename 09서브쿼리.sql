--서브쿼리
--다른문안에 select가 들어가는 것 
select salary from employees where first_name = 'John';
select salary from employees where employee_id= 110;

--서브쿼리는 항상 괄호로 묶여있어야한다.
select employee_id, salary 
from employees 
where salary >(
    select salary 
    from employees 
    where employee_id= 110
);

--error인 이유는? >의 연산자는 1개의 답만이 있어야하는데 뒤에 조건은 3개의 값을 가져온다.
--서브쿼리에 자리에는 아무거나 올수없으며, 타입에 맞는것이 와야한다.
select employee_id, salary 
from employees 
where salary >(select salary from employees where first_name = 'John');

--특정 서브쿼리는 order by절을 사용할 수 없다.

--in연산자 다음에는 여래개의 값이 나와도 되기때문에 가능하다.
select employee_id, salary, department_id
from employees
where department_id in(
    select department_id
    from departments
    where department_id<30
);
--단일행 서브쿼리
--110번 보다 입사날짜가 빠른 사원
select *
from employees
where hire_date < (
    select hire_date
    from employees
    where employee_id=110
);

--전체 평균 봉급보다 많은 봉급을 가져가는 사원 
select *
from employees
where salary > (
    select avg(salary) from employees
);



