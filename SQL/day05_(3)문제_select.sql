-- select 쿼리
---- 1. age 가 30세 이상 고객의 모든 컬럼 조회
SELECT *
FROM TBL_CUSTOMER# cus
JOIN TBL_BUY buy
ON cus.CUSTOMER_ID = buy.CUSTOMER_ID
WHERE cus.AGE >= 30;

---- 2. customer_id 'twice' 의 email 조회
SELECT EMAIL AS "twice 의 email"
FROM TBL_CUSTOMER#
WHERE CUSTOMER_ID = 'twice';

---- 3. category 'A2' 의 pname 조회
SELECT PNAME AS "A2 의 pname 조회"
FROM TBL_PRODUCT
WHERE CATEGORY = 'A2';

---- 4. 상품  price 의 최고값 조회
SELECT MAX(PRICE) AS "price 의 최고값 조회"
FROM TBL_PRODUCT;

---- 5. 'JINRMn5' 총구매 수량 조회
SELECT sum(QUANTITY) AS "JINRMn5 총구매 수량 조회"
FROM TBL_BUY
WHERE PCODE = 'JINRMn5';

---- 문제 추가 :
---- 1) pcode 별로 구매 수량 합계
SELECT PCODE, sum(QUANTITY) AS "pcode 별로 구매 수량 합계"
FROM TBL_BUY
GROUP BY PCODE;

---- 2) 가장 높은 순서대로 rank 구하기
SELECT PCODE, RANK() OVER (ORDER BY sum(QUANTITY))
FROM TBL_BUY
GROUP BY PCODE;

---- 6. customer_id 'mina012' 이 구매한 내용 조회
SELECT pdt.PNAME AS "customer_id 'mina012' 이 구매한 내용 조회"
FROM TBL_PRODUCT pdt
JOIN TBL_BUY buy
ON pdt.PCODE = buy.PCODE
WHERE buy.CUSTOMER_ID = 'mina012';

---- 7. 구매 상품 중  pcode 가 '2'이 포함된 것 조회
SELECT DISTINCT pdt.PNAME "구매 상품 중  pcode 가 '2'이 포함된 것"
FROM TBL_PRODUCT pdt
JOIN TBL_BUY buy
ON pdt.PCODE = buy.PCODE
WHERE pdt.PCODE LIKE '%2%';

---- 8. 구매 상품 중  pcode 에 'on'을 포함하는 것 조회(대소문자 구분없는 조회)
SELECT DISTINCT pdt.PNAME AS "구매 상품 중  pcode 에 'on'을 포함하는 것"
FROM TBL_PRODUCT pdt
JOIN TBL_BUY buy
ON pdt.PCODE = buy.PCODE
WHERE LOWER(pdt.PCODE) LIKE '%on%';

---- 9. 2024년에 상품을 구매한 고객ID, 이름, 구매날짜 조회
SELECT cus.CUSTOMER_ID AS "구매한 고객 ID", cus.NAME AS "이름", buy.BUY_DATE AS "구매날짜"
FROM TBL_CUSTOMER# cus
JOIN TBL_BUY buy
ON cus.CUSTOMER_ID = buy.CUSTOMER_ID
WHERE EXTRACT(YEAR FROM buy.BUY_DATE) = 2024;
-- to_char(buy.BUY_DATE, 'yyyy') = '2024';

---- 문제 추가 :
---- 1) 년도별 구매 건수 집계하기
SELECT EXTRACT(YEAR FROM buy.BUY_DATE) AS "년도", COUNT(QUANTITY) AS "구매 건수"
FROM TBL_BUY buy
GROUP BY EXTRACT(YEAR FROM buy.BUY_DATE);

---- 2) 년도별 and pcode 상품별(년도가 같을 때) 구매 건수 집계하기
SELECT EXTRACT(YEAR FROM buy.BUY_DATE) AS "년도", buy.PCODE, COUNT(buy.QUANTITY) AS "구매 건수"
FROM TBL_BUY buy
JOIN TBL_PRODUCT pdt
ON buy.PCODE = pdt.PCODE
GROUP BY EXTRACT(YEAR FROM buy.BUY_DATE), buy.PCODE;

---- 10. twice 가 구매한 상품과 가격, 구매금액을 조회하세요.
---- 단, 구매금액 계산은 가격 * 구매 수량 수식으로 합니다.
SELECT pdt.PNAME AS "구매상품", pdt.PRICE * buy.QUANTITY AS "구매금액" 
FROM TBL_PRODUCT pdt
JOIN TBL_BUY buy
ON pdt.PCODE = buy.PCODE
WHERE buy.CUSTOMER_ID='twice';

---- 구매 행(건수) 중에서 구매 금액이 가장 높은 것을 찾아보자. 10번 문제에 customer_id 컬럼 추가 조회
---- 오라클 FETCH 명령이 있습니다.(12c 버전 이상)
---- FETCH 는 결과 행 집합을 커서로 접근 할 수 있습니다.(first, last 등....)
select tp.PCODE,tp.PNAME, tp.PRICE , tp.PRICE*tb.QUANTITY as "구매금액"
from TBL_PRODUCT tp
join TBL_BUY tb
on tp.PCODE = tb.PCODE
order by "구매금액" desc  -- 정렬 필수
FETCH FIRST 1 ROWS ONLY;