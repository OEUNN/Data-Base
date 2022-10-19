--서브쿼리
--단일행 서브쿼리
select employee_id, first_name
from employees
where salary=(select max(salary) from employees);

--다중행 서브쿼리
--in, any, some, all, exists
select employee_id, first_name
from employees
where department_id in(
    select department_id
    from departments
    where location_id=1700
);

--in 연산자
select employee_id, first_name, job_id, department_id
from employees
where salary in(
    select max(salary)
    from employees
    group by department_id
);

--any, some :조건문중에 하나만 만족하면된다.
--앞에 연산자가 들어간다.
select employee_id, department_id
from employees
where department_id = any(10,11);

select employee_id, salary, department_id
from employees
where department_id=100 
    and salary>=any(
        select avg(salary)
        from employees
        group by department_id
    );

--all 연산자
--서브쿼리의 여러개의 값이 메인 조건문을 만족해야한다.
select employee_id, salary, department_id
from employees
where department_id=100 
    and salary>=all(8000,9000,100000) ;

--exists
--메인쿼리에 값과 상관없다. 서브쿼리에 값이 있으면 true이다.
select employee_id, department_id
from employees e
where exists(
    select department_name 
    from departments   
    where department_id in (e.department_id+200)
);

--게시물을 전혀 작성하지않은 멤버의 아이디와 이름을 가져오시오
select * from members;
select * from boards;

--1.조인방식(outer join)이용
select m.mid, m.mname
from members m ,boards b
where m.mid = b.mid(+) 
    and b.bno is null;

--2.서브쿼리 방식 (exists 이용)
select mid, mname
from members m
where exists(
    select bno
    from boards b
    where b.mid=m.mid
);

--근무도시가 시애틀인 사원의 이메일과 전화번호를 가져오시오
--방법1 : join 이용
select email, phone_number
from employees e, departments d, locations l
where e.department_id=d.department_id 
    and d.location_id=l.location_id
    and city = 'Seattle';
    
--방법2 : 서브쿼리 이용
--서브쿼리안에 서브쿼리 이용하기
select email, phone_number
from employees
where department_id in (
        select department_id
        from departments 
        where location_id= (
            select location_id
            from locations
            where city='Seattle'
        )
);


--다중열 서브쿼리
select employee_id, salary, department_id
from employees
where (department_id, salary) in (
    select department_id, max(salary)
    from employees
    group by department_id
);




