--뷰생성
--뷰를 만드는 이유? 모든 열을 사용하는게 아니라 특정 열만 사용하게 될때가 있을때 효율적으로 사용하자(편리성)
--아무나 직접 테이블에 접근해서 selecting을 할수 없도록 권한을 주지 않고 뷰를 통해서만 보게할수 있다.(보안성)
--객체 권환?(오른쪽 키로 권한부여) 시스템 권한?(우리가 코드로 주는 권한)
--뷰는 데이터를 가고있지 않다.지
create view v_emp
    as (select employee_id, email, salary from employees);
select * from v_emp;

--복잡한 sql문을 감추는 것
create view v_emp2
as(
    select employee_id, first_name, department_name
    from employees e, departments d
    where e.department_id=d.department_id
);
select * from v_emp2;

--30번 부서의 사원들만 볼수 있다.
--전체를 공개하는것이 아니고 부서별로 뷰를 만들어 주는 것이다.
--해당 부서는 해당 뷰를 통해서만 보기 가능하고
--제한된 데이터만 볼 수 있게 만든것이 뷰이다.
create view v_emp3
    as (
    select employee_id, email, salary 
    from employees
    where department_id=30
);
select * from v_emp3;


--or replace 기존의 뷰가 있으면 갱신해라
create or replace view v_emp3
    as (
    select employee_id, email, salary 
    from employees
    where department_id=40
);
select * from v_emp3;

--뷰 삭제
drop view v_emp3;

---------------------------------------------------------------------------
--뷰 DML(데이터 조작어)-insert, update, delete 
create table products(
    pno number primary key,
    pname varchar(50) not null,
    pprice number default 0 not null,
    pdate date default sysdate not null,
    pcompany varchar(50) null
);

create or replace view v_prod
as(
    select pno, pname, pprice
    from products
);
--실제로 insert되는것은 뷰가 아닌 테이블에 저장되는 것이다.
--뷰를 통해서 전부 저장되는 것이 아니다. 
--뷰를 만들때 원래 테이블에 값이 들어가야하는 pno, pname과 같이 not null인 컬럼이있으면 view를 통해서 값을 저장할수 있다.
insert into v_prod values(1,'TV',1000);
select * from products;

--update view
create or replace view v_emp3
    as (
    select employee_id, email, salary , department_id
    from employees
    where department_id=30
);
update v_emp3 set department_id=50 where employee_id=114;














