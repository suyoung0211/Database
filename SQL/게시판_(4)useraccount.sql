-- 회원 계정 저장

CREATE TABLE user_account(
	userid varchar2(50) NOT NULL,
	username varchar2(50) NOT NULL,   -- 이름
	password varchar2(100) ,
	birth date ,
	gender char(2),
	email varchar2(50),
	regDate date default sysdate,
	PRIMARY KEY(userid)
);

INSERT INTO user_account (userid, username, password, birth, gender, email) 
VALUES   ('wonder','이하니','1111','2001-12-25','F','honey@gmail.com');
INSERT INTO user_account (userid, username, password, birth, gender, email) 
VALUES   ('minkr','김미미','1111','1999-02-05','F','minkr@gmail.com');
INSERT INTO user_account (userid, username, password, birth, gender, email) 
VALUES   ('tom0099','강모모','1111','2003-09-11','F','tom0099@gmail.com');
INSERT INTO user_account (userid, username, password, birth, gender, email) 
VALUES   ('chchch','최수니','1111','1994-07-23','F','chchch@gmail.com');
INSERT INTO user_account (userid, username, password, birth, gender, email) 
VALUES   ('seri111','박세리','1111','1992-05-20','F','seri111@gmail.com');
INSERT INTO user_account (userid, username, password, birth, gender, email) 
VALUES   ('nara34','정나라','1111','1988-01-11','M','nara34@gmail.com');