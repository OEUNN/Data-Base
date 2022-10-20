--인덱스 생성
--nonunique로 생성된다.
--primary key와 unique는 인덱스가 자동 생성된다.
create index ix_member_mname
on members(mname);

--where절에 자주 언급되는 컬럼일 경우 컬럼의 인덱스를 이용해 하는게 효율적 
select * from members where mname='홍길동';
--ex)select * from members where mname like '%길동';
-----------------------------------------------------------------------
--복합 인덱스
--컬럼 두개를 묶어서 하나의 인덱스를 만들수 있다.
--두개의 컬럼이 자주 검색조건으로 사용 될 경우
select * from members where mtel like '%123%' and mcity like '서울';

create index ix_member_mtel_mcity
on members(mtel, mcity);

--------------------------------------------------------------
--인덱스 삭제
drop index ix_member_mtel_mcity;