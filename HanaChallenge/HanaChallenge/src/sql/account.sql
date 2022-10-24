DROP TABLE account;

CREATE TABLE account
(
    account_num    VARCHAR2(50) NOT NULL,
    account_pw    CHAR(4) NOT NULL,
    balance    NUMBER(38) DEFAULT 0 NOT NULL,
    account_type    char(2) NOT NULL,
    id    VARCHAR2(30) NOT NULL,
    account_name    VARCHAR2(50),
    bank_code    CHAR(4) DEFAULT '001' NOT NULL
);

INSERT INTO account VALUES ('1230-901-0613-01','1230',500000,'01','cjstk4_','부자되자!','001');
INSERT INTO account VALUES ('1230-912-1013-01','1230',230000,'01','cjstk4_','비상금','001');
INSERT INTO account VALUES ('1230-912-0218-01','1230',800000,'01','cjstk4_','여행가자','001');

INSERT INTO account VALUES ('1230-901-0613-02','1230',0,'02','cjstk4_','패널티 통장','001');

commit;

select * from account;