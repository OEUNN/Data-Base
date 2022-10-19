--별칭
--컬럼 내용을 연산할 경우에는 별칭을 붙여주는 것이 좋다.
--sql은 연산의 이름이 올수 있다. (as 생략가능하지만, 가급적이면 넣는다.)
select first_name, salary, salary*12 as yearsal
from employees;
