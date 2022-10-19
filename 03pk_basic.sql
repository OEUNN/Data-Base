--primary key
--중복허용x, null허용x
--방법1
drop table members;
create table members(
    mid varchar(10) primary key,
    memail varchar(50)  null
);

insert into members values('WINTER','한겨울');
/*
--중복 허용X
insert into members values('WINTER','한겨울');
--NULL 허용X
insert into members values(NULL,'한겨울');
*/
------------------------------------------------------
--방법2
drop table members;
create table members(
    mid varchar(10) NOT NULL,
    memail varchar(50)  null
);
--컬럼을 대상으로 수정하며, 제약조건 변경하기
ALTER TABLE MEMBERS 
    MODIFY(MID CONSTRAINT PK_MID PRIMARY KEY );
--제약조건을 대상으로 추가(더 자주 사용)
alter table members
    add constraint pk_mid primary key (mid);
------------------------------------------------------------------
--두개 이상의 컬럼을 이용해 pk만들기
drop table members;
--컬럼을 정의할때는 pk를 두개를 줄 수 없다.
create table members(
    first_no char(6) not null,
    second_no char(7) not null,
    memail varchar(50) null
);
--복합키
--pk는 하나만 만들어 지는데 두개의 컬럼을 묶어서 만든다
alter table members
    add constraint pk_ssn primary key (first_no,second_no);
--------------------------------------------------------------
--방법3
--컬럼을 지정하고 후에 제약조건을 걸수 있다.
drop table members;
create table members(
    mid char(6) not null,
    memail varchar(50) null,
    constraint pk_mid primary key(mid),
    constraint u_email unique (memail)
);
