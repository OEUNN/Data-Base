--조건식에도 연산식이 가능하다.
select email, salary*12 as yearsal
from employees
where salary*12>150000;
---------------------------------------------------------
--문자 비교 연산자
select first_name
from employees
where first_name >= 'A' and first_name < 'C';

select email, job_id
from employees
where job_id!='IT_PROG' and job_id<>'FI_ACCOUNT';
---------------------------------------------------------
--논리 부정 연산자
--자바에서 !는 SQL은 not이다
select email, job_id
from employees
where not (job_id!='IT_PROG' and job_id<>'FI_ACCOUNT');
---------------------------------------------------------
--in 연산자 : in 안에 들어가있는것중 하나여야 한다.
select email, job_id
from employees
where job_id='IT_PROG' or job_id='FI_ACCOUNT';

select email, job_id
from employees
where job_id in('IT_PROG','FI_ACCOUNT');
---------------------------------------------------------
--where절 자체를 부정
select email, job_id
from employees
where not job_id in('IT_PROG','FI_ACCOUNT');
--in 조건을 부정
select email, job_id
from employees
where  job_id not in('IT_PROG','FI_ACCOUNT');
---------------------------------------------------------
--between a and b 연산자
select email, salary
from employees
where salary>5000 and salary<=7000;
--연산자 3개 사용

select email, salary
from employees
where salary between 5000 and 7000;
--연산자 1개 사용
---------------------------------------------------------
--like 연산자와 와일드 카드
--'s%' :s가 앞에 와도 뒤에와도 상관없고 있기만하면 된다. 
select first_name
from employees
where first_name like 'St%';

select first_name, email
from employees
where first_name like '%ev%' or email like ' %ev%';

-- _(언더바) 는 문자 1개를 뜻한다.
select first_name, email
from employees
where email like ' _L%';
---------------------------------------------------------
-- is null연산자
select employee_id, first_name
from employees
where department_id is null;
-- department_id = null 은 되지 않는다.(null은 데이터가 아니다.)

--in null의 반대
select employee_id, first_name
from employees
where department_id is not null;
---------------------------------------------------------
--null은 데이터가 아니기 때문에 연산자체가 안된다.
--null이 있는 값을 코드로 확인해 보자
select * from employees where commission_pct is null;

select (salary*12)+(commission_pct*salary) as yearsal 
from employees;
---------------------------------------------------------
--집합연산자 union
select email, phone_number
from employees
where department_id=10 or department_id=20;

select email, phone_number
from employees
where department_id in(10,20);

select email, phone_number, department_id
from employees
where department_id=10
union
select email, phone_number,department_id
from employees
where department_id=20;