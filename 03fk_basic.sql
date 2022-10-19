--------------------
--foreign key 생성--
---------------------
drop table members;
drop table freeboards;

create table members(
    mid varchar(10) not null,
    mname varchar(20) not null
);
alter table members
    add constraint pk_mid primary key(mid);
create table freeboards(
    bno number not null,
    btitle varchar(50) not null,
    writer varchar(10) not null 
);
alter table freeboards 
    add constraint pk_bno primary key(bno);
    
insert into members values ('fall','한겨울');
insert into freeboards values(1,'단풍','fall');
insert into freeboards values(2,'단풍','winter');
--회원인 사람만 글쓰기를 해야한다. writer가 mid에 있어야한다.=참조값
------------------------------------------------------------------
--방법1
drop table freeboards;
create table freeboards(
    bno number not null,
    btitle varchar(50) not null,
    writer varchar(10) references members(mid)
    --writer varchar(10) constraint fk_writer references members(mid)
    --이름을 주고 싶으면 constraint 이름 을 주면 된다.
);
alter table freeboards 
    add constraint pk_bon primary key(bno);
-----------------------------------------------------------------
--방법2
drop table freeboards;
create table fresboards(
    bon number not null,
    btitle varchar(50) not null,
    constraint fk_writer foreign key(writer) references members(mid)
);
alter table freeboards 
    add constraint pk_bon primary key(bno);
    
------------------------------------------------------------------
--방법3(많이 사용됨)
drop table freeboards;
create table freeboards(
    bno number not null,
    btitle varchar(50) not null,
    writer varchar(10) not null
);
alter table freeboards 
    add constraint pk_bno primary key(bno);
alter table freeboards
    add constraint fk_writer foreign key(writer) references members(mid);

insert into members values ('fall','한겨울');
insert into freeboards values(1,'단풍','fall');
--fk로 인해 이제 안됨
--insert into freeboards values(2,'단풍','winter');
--------------------------------------------------------------------
--------
--삭제--
--------
--참조하고 있는 키는 삭제할 수 없음
delete from members where mid='fall';

--방법 1
--모든 참조하는 키를 포함한 행을 삭제(가장 위험한 방법)
drop table freeboards;
create table freeboards(
    bon number not null,
    btitle varchar(50) not null,
    writer varchar(10) not null
);
alter table freeboards 
    add constraint pk_bon primary key(bno);
alter table freeboards
    add constraint fk_writer 
    foreign key(writer) 
    references members(mid) on delete cascade;
    
insert into freeboards values(1,'단풍','fall');
delete from members where mid='fall';
--------------------------------------------------------------------
--방법 2
--열 데이터를 삭제할 때 데이터를 참조하는 데이터를 null로 수정
drop table freeboards;
create table freeboards(
    bno number not null,
    btitle varchar(50) not null,
    --null을 허용해주어야한다.
    writer varchar(10) null
);
alter table freeboards 
    add constraint pk_bno primary key(bno);
alter table freeboards
    add constraint fk_writer 
    foreign key(writer) 
    references members(mid) on delete set null;
    
insert into freeboards values(1,'단풍','fall');
delete from members where mid='fall';