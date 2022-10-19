drop table freeboards;
--fk때문에 freeboards 먼저 삭제
drop table members;

--방법1
create table members(
    mid varchar(20) primary key,
    mname varchar(20) not null,
    mage number(3) check(mage>0 and mage<200),
    mgrade char(1) check(mgrade in ('A','B','C'))
    --in은 목록중에 하나
);

insert into members
    values('winter','한겨울',25,'A' );
/*
--check제약 오류
insert into members
    values('winter','한겨울',-10,'A' );
insert into members
    values('winter','한겨울',300,'A' );
*/

--방법2(가장 많이 사용안함)
create table members(
    mid varchar(20) primary key,
    mname varchar(20) not null,
    mage number(3) not null,
    mgrade char(1) not null,
    constraint ch_mage check (mage>0 and mage<200),
    constraint ch_mgrade check (mgrade in ('A','B','C'))
);

--방법3
create table members(
    mid varchar(20) not null,
    mname varchar(20) not null,
    mage number(3) not null,
    mgrade char(1) not null
);
alter table members
    add constraint pk_mid primary key(mid);

alter table members
    add constraint ch_mage check (mage>0 and mage<200);
alter table members
    add  constraint ch_mgrade check (mgrade in ('A','B','C'));
