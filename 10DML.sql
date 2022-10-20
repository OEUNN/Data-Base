drop table boards;
drop table members;

create table members(
    mid varchar2(20) primary key,
    mname varchar2(20) not null,
    memail varchar2(100) unique null,
    mage number check (mage>0 and mage <300),
    mtel varchar2(20), 
    mcity varchar2(20) default '서울' not null
);

insert into members values('winter','눈송이','snow@mycompany.com',25,'010-123-1234','부산');
insert into members values('spring','봄돌이',null,25,null,default);
--최소한 insert문 not null인것만 하면된다.
insert into members(mid, mname) values ('summer','하여름');
select * from members;
commit;

create table boards(
    bno number primary key,
    btitle varchar2(100) not null,
    bcontent clob not null,
    bwriter varchar2(20) references members(mid) on delete cascade ,
    bdate date default sysdate not null
);

insert into boards values (1,'제목1','내용1','spring',default);
insert into boards values (2,'제목2','내용2','winter','2022,12,25');
insert into boards(bno,btitle, bcontent, bwriter) values (3,'제목3','내용3','summer');
insert into boards(bno,btitle, bcontent, bwriter) values (4,'제목4','내용4','summer');
insert into boards values (5,'제목5','내용5','winter',to_date('12.25.2022','MM.dd.yyyy'));

------------------------------------------------------------------------------------
--update는 추가되는 테이블에 null로 추가해야한다. where가 있어야한다.
update member set memail ='ice@mycompany.com', mage=mage+1, mtel='010-321-4321'
where mid='winter';

update boards set bwriter=(select mid from members where memail='ice@mycompany.com')
where bwriter='winter';
------------------------------------------------------------------------------------------
--delete 다음에 where조건절을 달아주어야한다.
delete from boards
where bwriter='winter';

delete from members
where bwriter='winter';

delete from members
where mid in ('summer','fall');








