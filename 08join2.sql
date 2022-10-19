--등가조인 => 내부조인(inner join)
--가장 많이 사용된다.
select email, department_name
from employees e, departments d
where e.department_id = d.department_id;

--inner join => SQL-92
select email, department_name
from employees e inner join departments d 
    on e.department_id=d.department_id;

--natural join => SQL-99
--단점 : 두 테이블에 똑같은 컬럼이름이 있어야한다.(궂이 연결조인을 만들 필요가 없다.)
select email, department_name
from employees e natural join departments d;

--join ~ using 
--연결조건을 뒤에 using통해 붙인다.
--단점 : 두 테이블에 같은 컬럼이 있어야한다.
select email, department_name
from employees e join departments d using(department_id);

--join~on
--칼럼의 이름이 달라도 사용하도록 하자
select email, department_name
from employees e join departments d 
    on(d.department_id=d.department_id);
    
-----------------------------------------------------------------
--등가조인 => 오부조인(outer join)
select employee_id,department_name
from employees e, departments d
where e.department_id(+)=d.department_id;

--left
select employee_id, department_name
from employees e left outer join departments d
on e.department_id=d.department_id;

--right
select employee_id, department_name
from employees e right outer join departments d
on e.department_id=d.department_id;
-------------------------------------------------------------
drop table boards;
drop table members;

create table members(
    mid varchar2(10) primary key,
    mname varchar2(20) not null
);
create table boards(
    bno number primary key,
    btitle varchar(100) not null,
    mid varchar2(10) references members(mid) on delete cascade,
    mname varchar2(20) not null
);

insert into members values('spring','김하늘');
insert into members values('summer','하여름');
insert into members values('fall','단풍잎');
insert into members values('winter','동장군');
commit;

insert into boards values(1,'제목1','spring','김하늘');
insert into boards values(2,'제목2','fall','단풍잎');
insert into boards values(3,'제목3','spring','이바다');
commit;
-------------------------------------------------------------
--칼럼의 이름만 가지고 비교를 해서 연결한다.
select m.mid,m.mname,bno, btitle, b.mid, b.mname
from members m ,boards b
where m.md=b.mid;

--컬럼이 같고, 값이 같을때 연결한다.(두가지의 조건을 확인)
select mid,mname,bno, btitle
from members m natural join boards b;
