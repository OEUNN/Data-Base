--세션
--데이터베이스 접속을 시작으로 여러 데이터베이스에서 관련 작업을 수행한후 접속을 종료하기까지 전체 기간을 의미합니다.
--한 연결 내에서 트랜잭션 작업을 할 수 있다.
--문제는 다른 세션에서 하게된다면, rollback, commit을 수행된 후 작업이 가능하다.
--수정중인 작업을 반영해서 읽지는 못한다.(수정되기전은 읽기 가능하다)
update boards
set btitle='수정제목1'
where bno=1;
commit;








