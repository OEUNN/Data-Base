--트랜잭션
--all or nothing
--하나의 최소 기능처리 작업 (소작업들이 모두 성공하는지 실패하는지 확인)

create table accounts(
    ano varchar2(15) primary key,
    owner varchar2(10) not null,
    balance number not null
);
--트랜잭션 시작
insert into accounts values('111-111','홍길동',10000);
insert into accounts values('111-121','김자바',0);
commit;
--트랜잭션 종료

--트랜잭션 시작
update accounts set balance=balance-1000 where ano ='111-111';
update accounts set balance=balance+1000 where ano ='111-121';
rollback;
--트랜잭션 종료

--트랜잭션 시작
insert into accounts values('111-111','홍길동',10000);
insert into accounts values('111-121','김자바',0);
--트랜잭션 종료

save point insertedPoint;

--트랜잭션 시작
update accounts set balance=balance-1000 where ano='111-111';
update accounts set balance=balance+1000 where ano ='111-121';
--트랜잭션 종료

savepoint updatedPoint;

delete from accounts;
--~~까지 rollback을 하겠다 지정가능
rollback to updatedPoint;
--트랜잭션 종료
select*from accounts







