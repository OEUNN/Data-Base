drop table employes;

create table employes(
    empno number(4) not null,
    ename varchar2(15) not null
);

insert into employes (empno, ename) values(1, '홍길동');
insert into employes (empno, ename) values(2, '김자바');
commit;

select * from employes;

--모든 행 삭제
delete from employes;
rollback;

--실제 테이블의 저장 공간 초기화
--rollback대상이 아니다.
truncate table employes;
