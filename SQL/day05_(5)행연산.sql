-- 조인 : 테이블의 컬럼을 합치는 작업
-- 행연산 : 행단위를 대상으로 하는 작업
-- UNION(합집합), INTERSECT(교집합), MINUS(차집합)


-- 데이터 특징 : 'wonder' 고객은 tbl_buy 에 없음
SELECT CUSTOMER_ID
FROM TBL_CUSTOMER#
UNION
SELECT CUSTOMER_ID  -- 자동으로 중복제거 하고 연산
FROM TBL_BUY;

-- 구매 이력이 있는 고객
SELECT CUSTOMER_ID
FROM TBL_CUSTOMER#
INTERSECT
SELECT CUSTOMER_ID  -- 자동으로 중복제거 하고 연산
FROM TBL_BUY;

-- 구매 이력이 없는 고객
SELECT CUSTOMER_ID
FROM TBL_CUSTOMER#  -- 4명
MINUS
SELECT CUSTOMER_ID  -- 자동으로 중복제거 하고 연산. 3명
FROM TBL_BUY;