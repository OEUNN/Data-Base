--서브쿼리 ROWNUM
--행번호
--데이터가 저장되는 실제 테이블에 존재하지는 않지만 특정 목적을 위해 테이블에 저장되어 있는 열처럼 사용가능한 열

select employee_id, first_name
from employees;

select rownum,employee_id, first_name
from employees;

select rownum,employee_id, first_name
from employees
order by employee_id;

select rownum,  first_name, salary
from employees
order by salary;
--rownum 시작시점 order by 이전 
--데이터를 가져오는 순서대로 rownum을 가져온다.

--oreer by를 위한 rownum의 개선
--from 절에 oredr by 테이블 새성
select rownum,  first_name, salary
from (
    select first_name, salary
    from employees
    order by salary 
);

--문제 : 우리 회사에서 봉급이 가장 작은사람 5명
select rownum,  first_name, salary
from (
    select first_name, salary
    from employees
    order by salary 
)
where rownum <=5;

--실행안됨. rownum은 몇개의 데이터를 가져올지 모르기 때문에 마지막 쪽은 가져올수 없다.
--rownum은 적다는 되는데 크다는 안된다.
select rownum,  first_name, salary
from (
    select first_name, salary
    from employees
    order by salary 
)
where rownum >5;

--------------------------------------------------------------------
--paging(페이징 처리)
--행수가 많아 특정 몇개의 행만 가져오기위해 사용
--중요중요!!
select rnum, employee_id, first_name
from (
    select rownum as rnum,  employee_id, first_name
    from (
        select employee_id, first_name
        from employees
        order by employee_id
    )
    where rownum<= 50--(pageNo*rowsPerPage)
)
where rnum >= 41--(pageNo-1)*rowPerPage+1;

/*Pager  설명
(처음)1,2,3,4,5(다음)(맨끝)
(처음)(이전)6,7,8,9,10(다음)(맨끝)
(처음)(이전)11,12,13,14,15(다음)(맨끝)
...
(처음)(이전)96,97(맨끝)

페이지당 행수(rowPerPage):10행
그룹당 페이지수(pagesPerGroup) : 5페이지

전체 행수(totalRows):970행 select count(*) from table
전체 페이지수 : Math.ceil(double)totalRows/rowPerPage
각 그룹의 시작 행번호: (page-1)*rowsPerPage+1
각 페이지 끝 행번호 : page * rowsPage
각 그룸의 시작 페이지 번호 : (group-1) * pagesPerGroup +1  
각 그룹의 끝 페이지 번호 : group * pagesPerGroup
*/













