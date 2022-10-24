DROP TABLE CHALLENGE;
CREATE TABLE challenge
(
    CHALLENGE_NO      number(5),
    CHALLENGE_NAME    VARCHAR2(100), 
    CHALLENGE_GOAL    number(10),
    CHALLENGE_STARTDATE  date,
    CHALLENGE_ENDDATE   date,
    CHALLENGE_PENALTYRATE number(10)    not null,
    ID  VARCHAR2(100)   not null,
    CONSUME_CODE       CHAR(2)        NOT NULL,
    ACCOUNT_NUM     VARCHAR2(100) ,
    NOW_SPANDING    NUMBER(10) DEFAULT 0
);

drop sequence seq_challenge_no;
create SEQUENCE seq_challenge_no nocache;

SELECT * FROM CHALLENGE;

