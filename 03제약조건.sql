--unique 제약조건에 따른 테이블 생성
--중복을 허락하지 않는다.
drop table members;

create table members(
    --unique는 여러개 존재 가능하다.
    mid varchar(10) unique not null,
    --primary key는 한 테이블에 하나만 존재 가능하다
    --unique not null == primary key
    memail varchar(50) constraint u_memail unique,
    --값은 중복허용하지 않지만, null은 중복혀용한다.
    mname varchar(10) not null
    );
    
    
insert into members values (null,'fall@company','홍길동');

select * from members;

desc members;

----------------------------------------------------
--테이블을 생성하며 제약 조건 이름 직접 지정
--이미 생성한 테이블에 제약 조건 지정하기
drop table members;
create table members(
    mid varchar(10) not null,
    memail varchar(50) null,
    mname varchar(10) not null
    );

--constraint 뒤에 이름을 쓴다.
alter table members
    modify(
        mid constraint u_mid unique,
        memail constraint u_memail unique
        );

--제약 조건 삭제하기
alter table members
    drop constraint u_memail;