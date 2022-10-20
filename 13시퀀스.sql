--시퀀스(sequence)
--중복이 되어서는 안된다.
--계속해서 다음다음 번호를 발급해주는 객체이다.

drop table boards;
create table boards(
    bno number primary key,
    btitle varchar(100) not null,
    bcontent clob not null
);

--시퀀스 생성
create sequence seq_boards_bno;
--nextval는 sequence가 가지고 있는 메소드
select seq_boards_bno.nextval from dual;
--currval :마지막 번호(현재번호)
select seq_boards_bno.currval from dual;

insert into boards 
values(seq_boards_bno.nextval,'제목','내용');
select * from boards;

--increment by 1 : 다음번호를 받을때는 1씩 증가 
--start with 100 : 처음 값을 100으로 시작하겠다.
--maxvalue 100 : 100의 값까지 증가할 것이다.(최대값 지정)->10^27까지 가능
--minvaalue 
--cycle : 100까지 하면 1로 다시 돌아간다.(default가 no cycle 이다.)
--cache 
--last_number : 






