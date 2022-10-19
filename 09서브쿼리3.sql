--from절의 서브쿼리
select email, department_name, city
from (
    select email, department_id 
    from employees 
    where department_id in (10,20)
    )e,(
    select department_id, department_name, location_id
    from departments
    )d,(
    select location_id, city
    from locations
    ) l
where e.department_id=d.department_id
    and d.location_id = l.location_id;

---------------------------------------------------
--with절
with
e as(
    select email, department_id 
    from employees 
    where department_id in (10,20)),
d as(
    select department_id, department_name, location_id
    from departments),
l as(
     select location_id, city
    from locations)
select email, department_name, city
from e, d, l
where e.department_id=d.department_id
    and d.location_id = l.location_id;

----------------------------------------------------------

select employee_id, department_id, salary
from employees e1
where salary>(
    select min(salary) from employees e2 
    where e2.department_id = e1.department_id
)
order by department_id, salary;
---------------------------------------------------------
select employee_id, first_name, job_id, salary, grade_id, department_id
from employees, grade
where salary between low_salary and hi_salary
    and department_id = 30;
    
--간단하게
select employee_id, first_name, job_id, salary, department_id, grade_id
from 
    (
    select employee_id, first_name, job_id, salary, department_id
    from employees
    where department_id = 30
    )e ,
    grade g
where salary between low_salary and hi_salary;

--selec절에 사용되는 서브쿼리
--join 사용x
select employee_id, first_name, job_id, salary, department_id, 
    (
    select grade_id 
    from grade 
    where e.salary between low_salary and hi_salary
    ) as grade_id
from employees e
where department_id=30;

---------------------------------------------------
--문제
select employee_id, first_name, job_id, department_name
from employees
where job_id='ST_CLERK';

--방법1 : join
select employee_id, first_name, job_id, department_name, d.department_id
from employees e, departments d
where e.department_id=d.department_id 
    and job_id='ST_CLERK';

--방법2 : from 서브쿼리
select  employee_id, first_name, job_id, department_name, d.department_id
from (
    select employee_id, first_name, job_id , department_id
    from employees
    where job_id='ST_CLERK'
    )e,departments d
where e.department_id=d.department_id;
    
--방법3 : select 서브쿼리
select employee_id, first_name, job_id, department_id,
    (
    select department_name
    from departments
    where e.department_id = department_id 
    )as dname
from employees e
where job_id='ST_CLERK';










