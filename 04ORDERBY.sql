--원하는 순서로 출력 데이터를 정렬하는 order by
--봉급액(salary) 순으로 올림차순으로 사원번호와 봉급 가져오기
select employee_id, salary 
from employees
order by salary asc;
--ase : assecding 올림차순

select employee_id, salary 
from employees
order by salary desc;
--desc : 내림차순

--부서별로 올림차순으로 정렬하고 같은 부서내에서 봉급을 내림차순으로 가져오기
select department_id, salary
from employees
order by department_id, salary desc;
--department_id 뒤에 asc가 생략되어 있다.
