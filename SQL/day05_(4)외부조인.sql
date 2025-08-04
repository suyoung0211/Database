-- 지금까지 했던 join 은 아래와 같이 tc.CUSTOMER_ID = tb.CUSTOMER_ID 행만
-- 컬럼을 합치는 '동등 조인'

SELECT *                -- tc.CUSTOMER_ID, tc.NAME, tb.BUY_DATE
FROM TBL_CUSTOMER# tc
LEFT JOIN TBL_BUY tb    -- left 에 있는 테이블(대체로 부모테이블)의 모든 행을 포함
ON tc.CUSTOMER_ID = tb.CUSTOMER_ID;

SELECT *                -- tc.CUSTOMER_ID, tc.NAME, tb.BUY_DATE
FROM TBL_CUSTOMER# tc
RIGHT JOIN TBL_BUY tb   -- right 에 있는 테이블의 모든 행을 포함. 부모테이블일 아니므로 동등조인 결과
ON tc.CUSTOMER_ID = tb.CUSTOMER_ID;

SELECT *
FROM TBL_BUY tb
RIGHT JOIN TBL_CUSTOMER# tc
ON tc.CUSTOMER_ID = tb.CUSTOMER_ID;


-- 구매 건수가 없는 고객을 조회하기
SELECT *
FROM TBL_CUSTOMER# tc
LEFT JOIN TBL_BUY tb
ON tc.CUSTOMER_ID = tb.CUSTOMER_ID
WHERE tb.BUY_SEQ is NULL;
-- ✅ 외부 조인일 때에는 추가 조건은 where 로 합니다. 외부 조인 후에 실행하도록 하기 위함.

-- 문제 요구사항이 구매 이력이 있는 모든고객을 조회하기
-- 이럴 때는 조건만 WHERE tb.BUY_SEQ is NOT NULL;
-- JOIN 없이 구매 이력이 있는 고객 찾기
select DISTINCT CUSTOMER_ID
from tbl_buy;



SELECT *
FROM TBL_BUY
WHERE CUSTOMER_ID = 'mina012';