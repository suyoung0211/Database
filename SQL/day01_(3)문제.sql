/* 
tbl_carco2 테이블의 데이터를 조회하는 예시를 만들어 보세요.
(SELECT ~ FROM tbl_carco2 WHERE 조건)
각자 7개 씩
 */

 -- (샘플) car 가 무엇이 있나요?
 SELECT DISTINCT CAR FROM TBL_CARCO2;
 -- distinct 키워드 : 칼럼값 하나 조회할 때, 중복을 제거한 결과

 -- 1. volume 이 2100 이상인 모든 컬럼 조회
 SELECT * FROM TBL_CARCO2 WHERE volume >= 2100;

 -- 2. co2 가 110 이상인 모든 칼럼 조회
 SELECT * FROM TBL_CARCO2 WHERE CO2 >= 110;

 -- 3. model 중 'C' 가 들어가는 모든 칼럼 조회
 SELECT * FROM TBL_CARCO2 WHERE MOELD LIKE '%C%';

 -- 4. weight 가 1100 보다 작은 모든 칼럼
 SELECT * FROM TBL_CARCO2 WHERE WEIGHT < 1100;

 -- 5. weight 가 1100 이하인 칼럼 중 co2 가 99 인 칼럼
 SELECT * FROM TBL_CARCO2 WHERE WEIGHT <= 1100 AND CO2 = 99;

 -- 6. car 가 'S' 로 시작하는 칼럼 중 volume 이 1200 보다 큰 칼럼
 SELECT * FROM TBL_CARCO2 WHERE CAR LIKE 'S%' AND VOLUME > 1200;

 -- 7. car 중 T ~ Z 사이 단어로 시작하는 칼럼
 SELECT * FROM TBL_CARCO2 WHERE CAR BETWEEN 'T%' AND 'Z%';