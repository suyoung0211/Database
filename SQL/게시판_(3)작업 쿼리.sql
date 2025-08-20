-- 1. 메인글 107번 글 상세보기
SELECT * FROM COMMUNITY c WHERE IDX = 107;

-- 2. 메인글 107번 댓글 목록 가져오기
SELECT * FROM COMMUNITYCOMMENTS cc WHERE MREF = 107;

-- 3. 메인글목록 전체 개수 구하기
SELECT count(*) FROM COMMUNITY c ;

-- 4. 메인글 107번 댓글 개수 구하기
SELECT count(*) FROM COMMUNITYCOMMENTS cc WHERE MREF = 107;

-- 5. 메인글 107번 조회수 +1 증가시키기(수정)
UPDATE COMMUNITY SET READCOUNT = READCOUNT +1 WHERE IDX = 107; 

-- 트랜잭션: 글상세보기 - select, update
-- 6. 메인글 107번 댓글 개수 업데이트 - 트랜잭션: 댓글쓰기 - insert, update
-- 댓글 개수 컬럼이 있으면
UPDATE COMMUNITY SET COMMENTCOUNT = COMMENTCOUNT + 1 WHERE idx = 107;
-- 댓글 개수 컬럼이 없으면 select 로 구해서 출력
UPDATE COMMUNITY SET COMMENTCOUNT = (SELECT count(*) FROM COMMUNITYCOMMENTS cc WHERE MREF = 107) WHERE idx = 107;

-- 7. 한페이지에 글 개수 10개로 하여 페이지네이션 처리가 된 글목록 가져오기
-- 게시판 글 조회 순서는 idx 내림차순
SELECT * FROM COMMUNITY c ORDER BY idx DESC ;

-- idx는 항상 연속적이지 않다(글 삭제 떄문에), 글 순서에 대한 연속적인 값이 필요 -> mysql(LIMIT), 오라클(rownum 컬럼을 활용)
-- 자바에서 계산할 계산식
-- start 번호 = (페이지번호-1)*페이지당글개수+1
-- end 번호 = start번호+(페이지당글개수-1)
SELECT rownum, temp.* FROM (SELECT * FROM COMMUNITY c ORDER BY idx DESC) temp WHERE rownum BETWEEN 1 AND 20;

-- 페이지네이션 글목록 완료: startNo=21, endNo=40 => 계산한 값으로 전달
-- rownum은 각 실행마다 테이블화 해서 메모리 저장하면서 안정적으로 동작(별칭도 필수)
SELECT * 
FROM 
(SELECT rownum rnum, temp.* FROM 
          (SELECT * FROM COMMUNITY c ORDER BY idx DESC) temp
) 
WHERE rnum BETWEEN 21 AND 40;

--8. 글 쓰기

--9. 글 삭제

--10. 글 수정(내용 수정)

--11. 댓글 쓰기

--12. 댓글삭제
