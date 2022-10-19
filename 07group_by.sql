--group by
--하나의 그룹에서 집계값을 내는 것
--where절 다음에 위치해 있다. 조건 검색-> 그룹핑 -> 정렬
--group by를 사용하기 위해서는 
--1.group by 뒤에 있는 내용과 select의 내용이 같아야한다.
--2. 집계함수가 있어야한다.(함수는 똑같지 않아도 된다.)
select department_id, sum(salary) , job_id
from employees
where department_id in (10, 20, 30)
group by department_id, job_id
order by department_id;

--having 조건(그룹핑한 후에 조건을 줄때)
--조건. 집계값만을 가지고 조건을 달아야한다.
select department_id, avg(salary)
from employees
where department_id in (10, 20, 30)
group by department_id
having avg(salary) > 5000
order by department_id;

--밑의 having 조건은 where절에서 조건을 달면 되는것이다.
--가능은 하다.
select department_id, avg(salary)
from employees
where department_id in (10, 20, 30)
group by department_id
having department_id=10
order by department_id;



