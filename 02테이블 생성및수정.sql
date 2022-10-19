/*
+++++++++++++++++++++++++
테이블 생성 및 수정, 이름변경
+++++++++++++++++++++++++
*/

--테이블 생성
create table emp_ddl(
    empno number(4) not null,
    ename varchar2(10) not null
);

--테이블 삭제
drop table emp_ddl;

--행 저장
insert into emp_ddl(empno, ename) values(1,'winter');
insert into emp_ddl(empno, ename) values(2,'summer');
commit;

--기존의 데이터가 있는 테이블에서 컬럼을 새로 추가할 때에는
--null을 허용하도록 해야 함.
--데이터를 채운 후 not null로 변경해함
alter table emp_ddl
    add(
       city varchar(10) null,
       age number(3) null
    );

--테이블 이름 변경(힌개씩만 가능)
alter table emp_ddl
    rename to employes;
    
--컬럼 이름 변경
alter table employes 
    rename column city to ecity;
    
--컬럼의 데이터 타입 변경
alter table employes
    modify(
        ename varchar2(15),
        ecity varchar2(20)
    );

--컬럼 삭제하기
alter table employes
    drop column eage;

--여러개 칼럼 한번에 삭제하기
alter table employes
    drop(ename, ecity);