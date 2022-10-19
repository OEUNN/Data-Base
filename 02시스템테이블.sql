--시스템 테이블에서 가져오기
--시스템 테이블은 관리자가 가지고있는 테이블이다.
select owner, constraint_name
from user_constraints;

