--decode
select employee_id, first_name, job_id,salary,  
    round (decode(job_id, 'AD_VP',salary*1.1,
            'FI_MGR', salary*1.3,
            salary*1.2) )as upsal
from employees
where job_id in ('AD_VP','FI_MGR','PU_MAN');

--case
--조건식이 따로따로 주어진다.
select employee_id, first_name, job_id,salary, 
    round (
        case job_id
             when 'AD_VP' then salary*1.1
             when 'FI_MGR' then salary*1.3
             else salary*1.2
             end
        )as upsal
from employees
where job_id in ('AD_VP','FI_MGR','PU_MAN');

--case문 원본값이 없을때
--job_id처럼 원본이 있을수도 있지만, 원본데이터가 없을수 있다. 
--원본이 없을 때는 when다음에는 조건식이 온다. 조건식이 true이면 then값 리턴
select employee_id, first_name, commission_pct,
    case
        when commission_pct is null then '해당사항 없음'
        when commission_pct >0 then '수당: ' || commission_pct
    end as comm_text
from employees;






