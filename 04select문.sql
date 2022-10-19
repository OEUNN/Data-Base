--전체 사원의 정보 가져오기
select * from employees;

--전체 사원의 특정 컬럼 정보 가져오기
select employee_id, first_name, last_name, department_id
from employees;

--사원들이 소속되어 있는 부서 번호 가져오기(중복제거)
select distinct department_id  from employees;

--직무번호와 부서번호를 결합해서 중복제거, 두개의 컬럼 비교
select distinct job_id, department_id from employees;
--all(명시적으로 붙이는 경우는 없다)
select all job_id, department_id from employees;