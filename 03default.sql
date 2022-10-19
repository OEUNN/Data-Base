-----------
--default--
-----------
drop table members;
--보통 default는 not null일때 준다.
create table members(
    mid varchar(20) primary key,
    mname varchar(20) not null,
    mdate date default sysdate not null ,
    mcity varchar(10) default '서울' null,
    mgrade char(1) default 'C' check(mgrade in('A','B','C'))
);

insert into members values('winter','홍길동',default ,default,default);
--값을 지정해주지 않아도 default 값들은 자동으로 지정된다.
insert into members(mid,mname) values('summer','하여름');
insert into members(mid,mname,mcity) values('fall','가을',null);