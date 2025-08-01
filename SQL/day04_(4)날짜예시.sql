-- 예제 테이블
CREATE TABLE tbl_member (
	mno NUMBER(5) PRIMARY KEY ,    		--회원번호
	name varchar2(50) NOT NULL,   		-- 이름
	email varchar2(100) UNIQUE ,  		-- 이메일. 널값은 허용합니다.
	join_date DATE default sysdate  -- default 는 기본값 키워드. 오라클 sysdate 는 현재날짜와 시간  	
				-- 가입날짜 , 날짜형식 : insert 할 때 날짜 패턴 'yyyy-mm-dd' 문자열이 자동으로 날짜형식 변환
				-- 출력형식 :  yyyy-mm-dd hh24:mi:ss
);

SELECT * FROM TBL_MEMBER  ;

-- 예제 데이터 : 
INSERT INTO 
	TBL_MEMBER			 
VALUES 
	(1,'김모모','momo@naver.com',to_date('2022-11-24','yyyy-mm-dd'));  
-- '2022-11-24' 기본 패턴은 날짜 타입 자동 변환

INSERT INTO TBL_MEMBER VALUES (2,'박나연','parkny@gmail.com',to_date('2023-10-24','yyyy-mm-dd'));

-- ⭕현재 세션에 대해 날짜 포맷 문자열 설정하기(vs code sql developer 는 직접 설정해야합니다.)
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
-- ⭕ 위의 설정값 후에는 to_date() 없이 문자열로 자동 변환
INSERT INTO TBL_MEMBER VALUES (3,'최슬기','slgichoi@naver.com','2024-09-24');
INSERT INTO TBL_MEMBER VALUES (4,'박사나','san@gmail.com','2023-10-05');
INSERT INTO TBL_MEMBER VALUES (5,'이나연','nayeon@gmail.com','2024-10-05');
INSERT INTO TBL_MEMBER VALUES (6,'강나현','nahyeon@gmail.com','2022-05-05');
INSERT INTO TBL_MEMBER VALUES (7,'나쯔위','na1234@gmail.com','2025-01-05');
INSERT INTO TBL_MEMBER(MNO,NAME,JOIN_DATE) VALUES (8,'강감찬','2024-05-05');
INSERT INTO 
	TBL_MEMBER(MNO,NAME) 
VALUES 
	(9,'이순신');
commit;	

-- 날짜 컬럼으로 조회하기
-- 2024년 1월1일 이후에 가입한 회원 조회 (정렬은 가입날짜 최신순)
SELECT * FROM TBL_MEMBER 
WHERE JOIN_DATE > '2024-01-01'
ORDER BY JOIN_DATE DESC ;


-- 2023년도에 가입한 회원만 조회(정렬은 먼저 가입한 날짜 순서대로)
  SELECT * FROM TBL_MEMBER
  WHERE JOIN_DATE >= '2023-01-01' AND JOIN_DATE <= '2023-12-31'  -- 날짜 타입으로 변환 후 
  ORDER BY JOIN_DATE ;

 
-- 날짜 출력 형식 :  gmail.com 이메일 가입자 이메일,가입날짜 추출
--       ㄴ 패턴 적용  yyyy-mm-dd 또는 mm/dd/yyyy  또는 yyyy년 mm월 dd일
 SELECT EMAIL , TO_CHAR(JOIN_DATE, 'yyyy"년" mm"월" dd"일"') 
 FROM TBL_MEMBER
 WHERE EMAIL LIKE '%@gmail.com' ;
 

-- 🔥날짜 기본 함수 : 1) 날짜 타입을 문자열로 변환 to_char()    2) 문자열을 날짜타입으로 변환 to_date() 
-- 2) 번 예시
-- 오라클에서 날짜 패턴 'yyyy-mm-dd','yyyymmdd','yyyy/mm/dd'
INSERT INTO TBL_MEMBER VALUES (10,'홍길동','gdHong@naver.com','20250104');   
INSERT INTO TBL_MEMBER VALUES (11,'홍길동2','gdHong2@naver.com','2025/01/04');
INSERT INTO TBL_MEMBER VALUES (12,'홍길동3','gdHong3@naver.com','01/04/2025');  -- 오류
INSERT INTO TBL_MEMBER VALUES (12,'홍길동3','gdHong4@naver.com','04-01-25');   -- yy-mm-dd
INSERT INTO TBL_MEMBER VALUES (13,'홍길동4','gdHong3@naver.com','25/01/04');  -- 1925년
SELECT * FROM TBL_MEMBER tm ;

-- 시간 포함한 문자열은 to_date 함수 필요. 
INSERT INTO TBL_MEMBER 
VALUES (99,'홍길순','gsHong@naver.com',
		to_date('2025-01-04 16:24:23','yyyy-mm-dd hh24:mi:ss'));

-- 회원들 가입날짜에서 가입시간을 추출
SELECT to_char(join_date,'hh24:mi:ss') AS "jtime"   
FROM TBL_MEMBER 
WHERE name in ('이순신','홍길순')
ORDER BY "jtime";	  -- 정렬 기준은 함수실행 결과


-- 2023년도에 가입한 회원만 조회(정렬은 먼저 가입한 날짜 순서대로) : to_char() 함수
--  'yyyy' 는 to_char() 문자열 변환 패턴
  SELECT * FROM TBL_MEMBER
  WHERE TO_CHAR(JOIN_DATE,'yyyy') ='2023'
  ORDER BY JOIN_DATE ;
  
  SELECT TO_CHAR(JOIN_DATE,'yyyy'),TO_CHAR(JOIN_DATE,'mm'),TO_CHAR(JOIN_DATE,'dd')
  FROM TBL_MEMBER
  ORDER BY JOIN_DATE ;

  SELECT join_date
  FROM TBL_MEMBER;
  commit;