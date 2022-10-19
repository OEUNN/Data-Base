--join
--결과가 나오기 전에 테이블을 합치는것
select email, phone_number, department_name
from employees , departments
--연결 조건
where employees.department_id=departments.department_id;

--alias사용으로 편하게 하기
select email, phone_number, department_name
from employees e , departments d
where e.department_id=d.department_id;

--from다음에 2개의 테이블이면 where에 연결조건이 하나가 있어야한다.
--항상 테이블수 -1 개의 where조건이 있어야한다.
select employee_id, email, phone_number, department_name
from employees e , departments d
where e.department_id=d.department_id;

--error의 이유 : 열의 정의가 애매합니다.
--같은 컬럼이면 어디서 가져오는지 명확히 표시해야한다.
--모두 alias로 표시해도 되지만 그럴 필요는 없다.
select email, phone_number, e.department_id, department_name
from employees e , departments d
where e.department_id=d.department_id;

--------------------------------------------------------------------
--등가 조인
select email, phone_number, e.department_id, department_name,salary
from employees e , departments d
where e.department_id=d.department_id 
    and d.department_id=20 
    and salary>100;

--문제, 사원의아이디와 폰넘버, 사원의 시티(employees와 locations 테이블 연결하기)
--3개를 연결하기 때문에 연결 조건은 2개
select employee_id, phone_number, city
from employees e, departments d, locations l
where e.department_id=d.department_id 
    and d.location_id=l.location_id;
    
--employees와 regtions 테이블 연결
select employee_id, phone_number, region_name
from employees e, departments d, locations l, countries c, regions r
where e.department_id=d.department_id 
    and d.location_id= l.location_id
    and l.country_id=c.country_id
    and c.region_id=r.region_id;
 
--한개의 테이블을 두개로 나눈다?
--self join
--alias로 사용할때는 ""로 띄어쓰기 가능
select  e1.employee_id as 사번, e1.first_name as 이름, e1.manager_id as "관리자 이름"
from employees e1, employees e2
where e1.manager_id=e2.employee_id;
---------------------------------------------------------------------------
drop table grade;
create table grade(
    grade_id char(1) primary key,
    low_salary number(8,2) not null,
    hi_salary number(8,2) not null
);
insert into grade values('A', 3001, 9999);
insert into grade values('B', 2001,3000);
insert into grade values('C', 1401, 2000);
insert into grade values('D', 1201, 1400);
insert into grade values('E', 700, 1200);
commit;
--------------------------------------------------------------------------
--비등가 조인
select employee_id, salary, grade_id
from employees e, grade g
where e.salary between g.low_salary and g.hi_salary;

--등가조인 : 같은 값끼리 연결
--외부조인 : 같은것 끼리는 같은것 끼리 연결하는데 다른것들도 나오게 하는것이다.(등가조인의 반대) 
--사원이 없는 부서의 번호와 이름이 나온다.
select employee_id, e.department_id,d.department_id, department_name
from employees e, departments d
where e.department_id(+)=d.department_id;

--사원이 없는 부서의 번호와 이름을 가져올수 있을까? 어떤조건을 달면?
--(+) 등가 조인이 된 테이블에 없어도 출력된다.
--(+) null이 추가될수 있는부분은 null을 추가해라
select d.department_id, department_name
from employees e, departments d
where e.department_id(+)=d.department_id
    and employee_id is null;

----------------------------------------------------------------------------
select emp.employee_id, emp.manager_id, mgr.manager_id
from employees emp , employees mgr
where emp.manager_id=mgr.employee_id(+);

--관리자가 없는 사원
select emp.employee_id, emp.manager_id, mgr.manager_id
from employees emp , employees mgr
where emp.manager_id=mgr.employee_id(+)
    and emp.manager_id is null;

    
    

