--함수
select last_name, upper(last_name), lower(last_name)
from employees;

select first_name
from employees
where lower(first_name) like '%s';

select email from employees;
--첫문자를 대문자로 나머지는 소문자
select initcap(email) from employees;
----------------------------------------------------
create table members(
    mid varchar(50) not null,
    mname varchar(50) not null
);
insert into members values('fall','한가을');
commit;

select mname, length(mname), lengthb(mname) from members;
----------------------------------------------------
--순수 컬럼이 아니라 다른결과를 이용한다면 alias를 사용해라
select first_name, substr(first_name, 5) as co1, substr(first_name,3,2) as co2
from employees;

----------------------------------------------------
--replace, 특정문자를 다른 문자로 바꿈
select phone_number, 
    replace(phone_number,'.','-'),
    replace(phone_number,'.')
from employees;

---------------------------------------------------
--데이터의 빈 공간을 특정 문자로 채우는 lpad, rpad
select first_name,
    rpad(substr(first_name,1,3),6,'*') as result
from employees;

--------------------------------------------------
--|| : 문자열 결합
select (first_name||','|| last_name)as name
from employees;
-- 두 문자열 데이터를 합치는 concat
select concat(first_name , concat(',',last_name))as name
from employees;
---------------------------------------------------
--특정 문자를 지우는 trim, ltrim, rtrim







    