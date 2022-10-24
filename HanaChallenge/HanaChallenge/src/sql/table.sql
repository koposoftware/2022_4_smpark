--�Һ� ī�װ� ���̺� ����
DROP TABLE consume_category;

CREATE TABLE consume_category
(
    consume_code    CHAR(2) NOT NULL,
    consume_category    VARCHAR2(100) NOT NULL
);

INSERT INTO consume_category(consume_code,consume_category)
    VALUES('01','����/��Ƽ');
    
INSERT INTO consume_category(consume_code,consume_category)
    VALUES('02','�ĺ�');

INSERT INTO consume_category(consume_code,consume_category)
    VALUES('03','�ְ�/���');

INSERT INTO consume_category(consume_code,consume_category)
    VALUES('04','����/����');
    
INSERT INTO consume_category(consume_code,consume_category)
    VALUES('05','�Ƿ�/�ǰ�');
    
INSERT INTO consume_category(consume_code,consume_category)
    VALUES('06','ī��/����Ʈ');
    
INSERT INTO consume_category(consume_code,consume_category)
    VALUES('07','������/��Ʈ');
    
INSERT INTO consume_category(consume_code,consume_category)
    VALUES('08','��ȭ��Ȱ');
    
INSERT INTO consume_category(consume_code,consume_category)
    VALUES('09','����/�ڵ���');
    
INSERT INTO consume_category(consume_code,consume_category)
    VALUES('10','��Ÿ');
    
    
commit;

select * from CONSUME_CATEGORY;


--�Һ񳻿� ���̺�
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
