-- dual 테이블 : 수식, 함수 연산 테스트할 때 사용하는 임시 테이블
SELECT 2+3 FROM dual;

-- 날짜 함수
SELECT SYSDATE FROM dual;

-- 출력형식은 to_char() 변경
SELECT TO_CHAR(sysdate, 'YYYY-MM-DD HH24:MI:SS') FROM dual; -- 24시 기준
SELECT TO_CHAR(sysdate, 'YYYY-MM-DD HH:MI:SS am') FROM dual; -- 12시 기준
-- to_char() 함수 패턴은 위의 포맷에서 년도, 월, 일, 시, 분, 초 각각을 출력도 가능합니다.
-- extract(year from sysdate), extract(month from sysdate) 는 년도, 월 추출

-- 소수점 3자리로 초(ms 단위까지) 값 생성. +09:00 는 표준시와 차이
SELECT SYSTIMESTAMP FROM dual;

-- '날짜 타입'의 연산 : 날짜 사이의 차이
-- 문자열을 날짜 타입으로 변환 : to_date() 함수

-- 1) 날짜 사이의 차이를 구할 때 : 일 단위 
---- '2025-08-04' 과 '2025-12-25' 의 차이
SELECT TO_DATE('2025-12-25', 'YYYY-MM-DD') - TO_DATE('2025-08-04', 'YYYY-MM-DD')
FROM dual;

SELECT TRUNC(TO_DATE('2025-12-25', 'YYYY-MM-DD') - SYSDATE + 1)
FROM dual;

SELECT TRUNC(TO_DATE('2025-08-06', 'YYYY-MM-DD') - SYSDATE + 1)
FROM dual;

---- 날짜 더하기 연산
SELECT SYSDATE + 3 FROM dual;

-- 2) 날짜 사이의 차이를 구할 때 : 개월 수 단위(월 값만 가지고 뺄셈으로 못함)
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2026-02-01', 'YYYY-MM-DD'))
FROM dual;

---- 뺄셈 대신에 DATEDIFF 함수 : 다른 DBMS 함수

---- 현재 날짜에서 개월 수 더하기
SELECT ADD_MONTHS(SYSDATE, 15) FROM dual;