/*
++++++++++++++++++++
제약 조건 : Not Null
++++++++++++++++++++
*/

drop table members;
create table members(
    mid varchar(20) not null,
    mname varchar(20) not null,
    mtel varchar(20) null
);

insert into members (mid, mname, mtel) values ('winter','한겨울','010-123-1234');
/*
--위의 컬럼과 같다
--컬럼 리스트가 생략되면 DB에 추가된 컬럼 순서대로 모든 컬럼의 값을 제공
insert into members values ('winter','한겨울','010-123-1234');
*/

--명시적으로 null로 저장
insert into members (mid, mname, mtel)
values ('winter','한겨울',null);
/*
--위의 insert문과 같다.
--컬럼 리스트에 없는 컬럼은 null로 저장됨.
insert into members (mid, mname)
values ('winter','한겨울');
*/

--not null은 null로 수정할 수 없다.
--update members set mid=null where mid='winter';