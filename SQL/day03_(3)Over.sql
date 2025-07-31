/*
    OVER는 함수 자체는 아니며 분석(통계) 함수와 함께 쓰이는 절(Clause)
    PARTITION BY를 이용하여 OVER 절 안에서
    RANK(), ROW_NUMBER(), SUM(), AVG() 같은 함수들이 어떻게 계산될지 범위를 지정해주는 역할
    PARTITION BY 를 이용하여 OVER 절 안에서 그룹화 역할
    원래 행을 유지하면서 추가 정보 표시
    각 행에 대해 그룹 내 집계 결과를 보고 싶을 때
*/

SELECT
    CAR,
    MODEL,
    CO2,
    AVG(CO2) OVER(ORDER BY CAR) AS "co2평균" -- car 컬럼 정렬 후 같은 값끼리 묶어서 co2 평균 구하기
FROM TBL_CAR_CO2;

SELECT
    DISTINCT CAR,
    AVG(CO2) OVER(ORDER BY CAR) AS "co2평균" -- car 컬럼 정렬 후 같은 값끼리 묶어서 co2 평균 구하기
FROM TBL_CAR_CO2;

-- OVER 는 순위(RANK 함수)를 구할 때
-- co2 기준. 값이 작은 것이 순위를 1부터
--- 1) RANK() 같은 값을 같은 순위
SELECT
    CAR,
    MODEL,
    CO2,
    RANK() OVER(ORDER BY CO2) AS "co2rank" -- co2 로 정렬(내림차순) 후 순위 매김
FROM TBL_CAR_CO2;

--- 2) row_number() 같은 값도 다른 순위(임의)
SELECT
    CAR,
    MODEL,
    CO2,
    ROW_NUMBER() OVER(ORDER BY CO2) AS "co2순위" -- co2 로 정렬(내림차순) 후 순위 매김
FROM TBL_CAR_CO2;

--- 3) RANK() : 특정 컬럼(car) 그룹안에서 순위
SELECT
    CAR,
    MODEL,
    CO2,
    RANK() OVER(PARTITION BY CAR ORDER BY CO2) AS "co2순위" -- co2 로 정렬(내림차순) 후 순위 매김
FROM TBL_CAR_CO2;

-- rank 결과에 조건을 이용한 검색을 하려면 '서브쿼리' 사용
-- select 안에서 from 또는 where 에서 아용되는 다른 select
-- 동일한 car 그룹 안에서 co2가 제일 적은 1등 모델 조회하기
SELECT *
FROM (
SELECT
    CAR,
    MODEL,
    CO2,
    RANK() OVER(PARTITION BY CAR ORDER BY CO2) AS "co2rank" -- co2 로 정렬(내림차순) 후 순위 매김
FROM TBL_CAR_CO2)
WHERE "co2rank" = 1; -- "co2rank" 컬럼 인식

-- 오류 : "co2rank": invalid identifier
SELECT
    CAR,
    MODEL,
    CO2,
    RANK() OVER(PARTITION BY CAR ORDER BY CO2) AS "co2rank" -- co2 로 정렬(내림차순) 후 순위 매김
FROM TBL_CAR_CO2
WHERE "co2rank" = 1; -- 새로 생긴 "co2rank" 컬럼은 여기 where에 바로 사용 못함

-- 요구사항 : 동일한 car 그룹안에서 co2가 제일 많은(max) 1등 모델을 조회하기
SELECT *
FROM (
SELECT
    CAR,
    MODEL,
    CO2,
    RANK() OVER(PARTITION BY CAR ORDER BY CO2 DESC) AS "co2rank" -- co2 로 정렬(내림차순) 후 순위 매김
FROM TBL_CAR_CO2)
WHERE "co2rank" = 1; -- "co2rank" 컬럼 인식
-- DESC 는 오름차순 : 큰값 -> 작은값

-- 직접 테이블에서 조회
SELECT *
FROM TBL_CAR_CO2
ORDER BY CAR, CO2 DESC; --car 는 오름차순, co2 는 내림차순