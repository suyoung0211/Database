-- 테이블 생성
-- tbl_customer# 테이블 생성
CREATE TABLE tbl_customer#
(
    customer_id VARCHAR2(20)    NOT NULL,
    name VARCHAR2(20),
    email VARCHAR2(30)          NOT NULL,
    age NUMBER(3,0)             default 0,
    reg_date DATE               default SYSDATE,
    CONSTRAINT PK_customer_id PRIMARY KEY (customer_id)
);

-- UNIQUE 추가
ALTER TABLE tbl_customer#
ADD CONSTRAINT UQ_email UNIQUE (email);

-- comment
COMMENT ON COLUMN tbl_customer#.reg_date IS '등록날짜';

-- tbl_customer# 테이블 데이터 추가
INSERT INTO TBL_CUSTOMER# VALUES
('mina012', '김미나', 'kimm@gmail.com', 20, TO_DATE('2025-03-10 14:23:25','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_CUSTOMER# VALUES
('hongGD', '홍길동', 'gil@korea.com', 32, TO_DATE('2023-10-21 11:12:23','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_CUSTOMER# VALUES
('twice', '박모모', 'momo@daum.net', 29, TO_DATE('2024-12-25 19:23:45','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_CUSTOMER# VALUES
('wonder', '이나나', 'lee@naver.com', NULL, TO_DATE('2024-12-31 23:58:59','YYYY-MM-DD HH24:MI:SS'));


-- tbl_product 테이블 생성
CREATE TABLE tbl_product
(
    pcode VARCHAR2(20),
    category CHAR(2)        NOT NULL,
    pname VARCHAR2(50),
    price NUMBER,
    CONSTRAINT PK_pcode PRIMARY KEY (pcode)
);

-- comment
COMMENT ON TABLE tbl_product IS '상품';
COMMENT ON COLUMN tbl_product.pcode IS '상품코드';
COMMENT ON COLUMN tbl_product.category IS '카테고리';
COMMENT ON COLUMN tbl_product.pname IS '상품명';
COMMENT ON COLUMN tbl_product.price IS '가격';

-- tbl_product 데이터 추가
INSERT INTO TBL_PRODUCT VALUES ('DOWON123a', 'B2', '동원참치선물세트', 54000);
INSERT INTO TBL_PRODUCT VALUES ('CJBAb12g', 'B1', '햇반 12개입', 14500);
INSERT INTO TBL_PRODUCT VALUES ('JINRMn5', 'B1', '진라면 5개입', 6350);
INSERT INTO TBL_PRODUCT VALUES ('APLE5kg', 'A1', '청송사과 5kg', 66000);
INSERT INTO TBL_PRODUCT VALUES ('MANGOTK4r', 'A2', '애플망고 1kg', 32000);

-- tbl_buy 테이블 생성
CREATE TABLE tbl_buy
(
    buy_seq NUMBER,
    customer_id VARCHAR2(20),
    pcode VARCHAR2(20),
    quantity NUMBER,
    buy_date TIMESTAMP,
    CONSTRAINT PK_buy_seq PRIMARY KEY (buy_seq)
);

-- comment
COMMENT ON TABLE tbl_buy IS '구매';
COMMENT ON COLUMN tbl_buy.buy_seq IS '구매번호';
COMMENT ON COLUMN tbl_buy.customer_id IS '고객_ID';
COMMENT ON COLUMN tbl_buy.pcode IS '상품코드';
COMMENT ON COLUMN tbl_buy.quantity IS '구매수량';
COMMENT ON COLUMN tbl_buy.buy_date IS '구매날짜';


-- 외래키 추가
ALTER TABLE tbl_buy
ADD CONSTRAINT FK_tbl_customer#_TO_tbl_buy
FOREIGN KEY (customer_id)
REFERENCES tbl_customer# (customer_id);

ALTER TABLE tbl_buy
ADD CONSTRAINT FK_tbl_product_TO_tbl_buy
FOREIGN KEY (pcode)
REFERENCES tbl_product (pcode);

-- 시퀀스 생성
CREATE SEQUENCE seq_tblbuy
START WITH 2001;

-- tbl_buy 데이터 추가
INSERT INTO TBL_BUY VALUES
(SEQ_TBLBUY.nextval, 'mina012' , 'CJBAb12g' , 5, TO_DATE('2024-07-15 14:33:15','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_BUY VALUES
(SEQ_TBLBUY.nextval, 'mina012' , 'APLE5kg' , 2, TO_DATE('2024-07-15 14:33:15','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_BUY VALUES
(SEQ_TBLBUY.nextval, 'mina012' , 'JINRMn5' , 2, TO_DATE('2025-02-09 14:33:15','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_BUY VALUES
(SEQ_TBLBUY.nextval, 'twice' , 'JINRMn5' , 3, TO_DATE('2023-12-21 14:33:15','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_BUY VALUES
(SEQ_TBLBUY.nextval, 'twice' , 'MANGOTK4r' , 2, TO_DATE('2025-01-10 14:33:15','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_BUY VALUES
(SEQ_TBLBUY.nextval, 'hongGD' , 'DOWON123a' , 1, TO_DATE('2025-01-13 14:33:15','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_BUY VALUES
(SEQ_TBLBUY.nextval, 'hongGD' , 'APLE5kg' , 1, TO_DATE('2024-09-09 14:33:15','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_BUY VALUES
(SEQ_TBLBUY.nextval, 'hongGD' , 'DOWON123a' , 1, TO_DATE('2025-01-13 09:33:15','YYYY-MM-DD HH24:MI:SS'));