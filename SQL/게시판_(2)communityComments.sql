/*
커뮤니티 게시판을 위한 db 설계
- 주요 항목을 일반 게시판 형식
- 메인글에 댓글을 작성하는 형식

메인글 테이블명 : community
컬럼 항목 : 글번호(PK), 작성자(로그인한 사용자), 글 제목, 글 내용, 조회수, 작성 날짜 시간, ip, 댓글 개수

댓글 테이블명 : communityComments
컬럼 항목 : 댓글번호(PK), 메인글번호(FK), 작성자(로그인한 사용자), 댓글 내용, 작성 날짜 시간, ip
*/

CREATE TABLE communityComments (
	idx number(9) NOT NULL,
	mref number(9) NOT NULL, -- 메인 글번호
	writer varchar2(50) NOT NULL,
	content varchar2(1000) NOT NULL,
	readCount number(10) DEFAULT '0',
	createdAt DATE DEFAULT sysdate,
	ip varchar2(15) DEFAULT '127.0.0.1',
	heart number(4) DEFAULT '0',
	PRIMARY KEY(idx)
);

ALTER TABLE COMMUNITYCOMMENTS
ADD CONSTRAINT FK_mref
FOREIGN KEY (mref)
REFERENCES COMMUNITY (idx);


ALTER TABLE tbl_buy
ADD CONSTRAINT FK_tbl_product_TO_tbl_buy
FOREIGN KEY (pcode)
REFERENCES tbl_product (pcode);


CREATE SEQUENCE comment_idx_seq;

INSERT INTO COMMUNITYCOMMENTS (IDX,MREF,WRITER,CONTENT,CREATEDAT,IP,HEART) 
VALUES (comment_idx_seq.nextval,180,'wonder','읽어 보고 싶은 책이에요. 이번 주말에 필독 예약합니다. ㅎㅎ',TIMESTAMP'2023-11-27 21:33:53.0','127.0.0.1',0);
INSERT INTO COMMUNITYCOMMENTS (IDX,MREF,WRITER,CONTENT,CREATEDAT,IP,HEART) 
VALUES (comment_idx_seq.nextval,180,'wonder','궁금해지는 내용이네요 ~^^',TIMESTAMP'2023-11-27 21:35:17.0','127.0.0.1',0);