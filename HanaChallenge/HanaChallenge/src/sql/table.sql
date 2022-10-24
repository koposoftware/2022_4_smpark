--소비 카테고리 테이블 생성
DROP TABLE consume_category;

CREATE TABLE consume_category
(
    consume_code    CHAR(2) NOT NULL,
    consume_category    VARCHAR2(100) NOT NULL
);

INSERT INTO consume_category(consume_code,consume_category)
    VALUES('01','쇼핑/뷰티');
    
INSERT INTO consume_category(consume_code,consume_category)
    VALUES('02','식비');

INSERT INTO consume_category(consume_code,consume_category)
    VALUES('03','주거/통신');

INSERT INTO consume_category(consume_code,consume_category)
    VALUES('04','여행/숙박');
    
INSERT INTO consume_category(consume_code,consume_category)
    VALUES('05','의료/건강');
    
INSERT INTO consume_category(consume_code,consume_category)
    VALUES('06','카페/디저트');
    
INSERT INTO consume_category(consume_code,consume_category)
    VALUES('07','편의점/마트');
    
INSERT INTO consume_category(consume_code,consume_category)
    VALUES('08','문화생활');
    
INSERT INTO consume_category(consume_code,consume_category)
    VALUES('09','교통/자동차');
    
INSERT INTO consume_category(consume_code,consume_category)
    VALUES('10','기타');
    
    
commit;

select * from CONSUME_CATEGORY;


--소비내역 테이블
DROP TABLE consume_list;
DROP SEQUENCE seq_consume_no;

CREATE TABLE consume_list
(
    consume_no    NUMBER(5) NOT NULL,
    consume_amount    NUMBER(10) NOT NULL,
    consume_date    DATE NOT NULL,
    consume_store    VARCHAR2(100) NOT NULL,
    consume_code    CHAR(2) NOT NULL,
    id    VARCHAR2(100) NOT NULL
);

CREATE SEQUENCE seq_consume_no;
commit;
SELECT * FROM CONSUME_LIST;
