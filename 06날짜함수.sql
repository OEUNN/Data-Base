--날짜 연산
--insert에 오늘 날짜를 넣고싶을때 자주 사용된다.
create table boards(
    bno number primary key,
    btitle varchar(50) not null,
    bdate date not null
);
insert into boards values(1,'제목', sysdate);
select * from boards;

select sysdate, sysdate+14 from dual;
-----------------------------------------------------
--이렇게 하면 오류가난다.
select '2022-12-31' - sysdate from dual;
--문자를 날짜로 바꾸는 방법
select floor(to_date('2022-12-31','YYYY-MM-dd') - sysdate) 
from dual;

---------------------------------------------------------
--날짜 함수
--몇개월 이후 날짜를 구하는 ADD_MONTHS
select sysdate, add_months(sysdate,1) from dual;

--두 날짜 간의 개월 수 차이 : MONTHS_BETWEEN
select months_between (to_date('2022-12-31','YYYY-MM-dd'),sysdate) 
from dual;

--돌아오는 요일, 달의 마지막 날짜 : NEXT_DAY, LAST_DAY
select sysdate, next_day(sysdate,'금') from dual;
select sysdate, last_day(sysdate) from dual;
---------------------------------------------------------
--날짜,숫자 데이터를 문자 데이터로 변환하는 TO_CHAR
--날짜 -> 문자
select to_char(hire_date, 'YYYY.MM.dd HH::mm:ss am')
from employees;
--숫자 -> 문자 
--정수부분 3자리마다 ,를 넣어라
select to_char(salary, 'L99,999.00') from employees;
----------------------------------------------------------
--문자 데이터를 날짜 데이터로 변화하는 to_date
insert into boards values(2,'제목2','2022,10.17');
select *from boards where bdate='2022.10.17';
select * from boards where bdate>'2022.10.16';
--날짜는 위에 처럼 묵시적으로 꼭 to_date를 안해줘도 사용가능하다.
insert into boards 
values(2,'제목2',to_date('2022,10.17','yyy.mm.dd'));
--하지만 날짜 연산을 하기위해서는 to_char를 해주어야한다.
select floor(to_date('2022-12-31','YYYY-MM-dd') - sysdate) 
from dual;




