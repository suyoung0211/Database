/* 
    시퀀스 sequence : 연달아 일어남, 일련의 연속
    자동으로 값을 생성해 줍니다. 정수값을 일정간격(대부분 1)으로 증가시키면서 생성
    🌟 시퀀스를 이용하여 기본키의 값을 자동생성합니다.

    [참고] mysql 은 시퀀스는 없고 컬럼에 auto increment 설정
*/

CREATE SEQUENCE test_seq;

CREATE SEQUENCE test2_seq
START WITH 1001;

CREATE SEQUENCE test3_seq
START WITH 1001
INCREMENT BY 10;

-- 시퀀스에서 사용하는 속성
-- '현재' 시퀀스의 값 currval
-- '다음차례' 시퀀스의 값 nextval

-- dual 테이블 : 오라클의 임시 테이블. 함수, 시퀀스 테스트에 사용
SELECT test_seq.nextval FROM dual;
-- 값의 나열 : 1, 2, 3, 4, ...

SELECT test2_seq.nextval FROM dual;
-- 값의 나열 : 1001, 1002, 1003, 1004, ...

SELECT test3_seq.nextval FROM dual;
-- 값의 나열 : 1001, 1011, 1021, 1031, ...

-- 시퀀스를 기본키에 사용하기
CREATE TABLE tbl_car_co2 (
    idx NUMBER PRIMARY KEY,
    car VARCHAR2(50),
    model VARCHAR2(50),
    volume NUMBER(4),
    weight NUMBER(4),
    co2 NUMBER(3)
);

-- 유일한 값을 가져야하는 IDX PK 칼럼 값을 시퀀스로 주겠습니다.
INSERT INTO TBL_CAR_CO2(IDX, CAR, MODEL, VOLUME, WEIGHT, CO2)
VALUES (TEST2_SEQ.nextval,'Toyota','Aygo',1000,790,99);
INSERT INTO TBL_CAR_CO2(IDX, CAR, MODEL, VOLUME, WEIGHT, CO2)
VALUES (TEST2_SEQ.nextval,'Mitsubishi','Space Star',1200,1160,95);
INSERT INTO TBL_CAR_CO2(IDX, CAR, MODEL, VOLUME, WEIGHT, CO2)
VALUES (TEST2_SEQ.nextval,'Skoda','Citigo',1000,929,95);
INSERT INTO TBL_CAR_CO2(IDX, CAR, MODEL, VOLUME, WEIGHT, CO2)
VALUES (TEST2_SEQ.nextval,'Mini','Cooper',1500,1140,105);
INSERT INTO TBL_CAR_CO2(IDX, CAR, MODEL, VOLUME, WEIGHT, CO2)
VALUES (TEST2_SEQ.nextval,'VW','Up!',1000,929,105);
INSERT INTO TBL_CAR_CO2(IDX, CAR, MODEL, VOLUME, WEIGHT, CO2)
VALUES (TEST2_SEQ.nextval,'Skoda','Fabia',1400,1109,90);
INSERT INTO TBL_CAR_CO2(IDX, CAR, MODEL, VOLUME, WEIGHT, CO2)
VALUES (TEST2_SEQ.nextval,'Ford','Fiesta',1500,1112,98);
INSERT INTO TBL_CAR_CO2(IDX, CAR, MODEL, VOLUME, WEIGHT, CO2)
VALUES (TEST2_SEQ.nextval,'Ford', 'Fiesta', 1000, 1112, 99);
INSERT INTO TBL_CAR_CO2(IDX, CAR, MODEL, VOLUME, WEIGHT, CO2)
VALUES (TEST2_SEQ.nextval,'Opel', 'Zafira', 1600, 1405, 109);
INSERT INTO TBL_CAR_CO2(IDX, CAR, MODEL, VOLUME, WEIGHT, CO2)
VALUES (TEST2_SEQ.nextval,'Mercedes', 'SLK', 2500, 1395, 120);

SELECT *
FROM TBL_CAR_CO2;

-- 다시 초기화 테스트
TRUNCATE TABLE tbl_car_co2; -- 테이블 데이터 모두 삭제

SELECT *
FROM TBL_CAR_CO2;

DROP SEQUENCE test2_seq;    -- 시퀀스 삭제
-- create sequence test2_seq 실행
-- insert 실행

-- 참고 : autocommit 설정 또는 commuit 실행이 불편하다.
--> connection 설정 Advanced 에서 Auto Commit 을 체크