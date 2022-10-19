select salary, 
    round(salary/31), 
    round(salary/31,2),
    trunc(salary/31),
    trunc(salary/31,2),
    ceil(salary/31),
    floor(salary/31),
    mod(salary,31)
from employees;

