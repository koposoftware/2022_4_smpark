DROP TABLE transaction;

CREATE TABLE transaction
(
    my_account    VARCHAR2(50) NOT NULL,
    my_balance    NUMBER(38) NOT NULL,
    trans_no    NUMBER(38) NOT NULL,
    trans_type    VARCHAR2(30) NOT NULL,
    target_name    VARCHAR2(30) NOT NULL,
    trans_amount    NUMBER(38) NOT NULL,
    trans_date    DATE DEFAULT SYSDATE NOT NULL,
    target_account    VARCHAR2(50) NOT NULL,
    target_bankcode    CHAR(3) NOT NULL
);
drop sequence seq_transaction;
create SEQUENCE seq_transaction nocache;

select * from transaction;

TRUNCATE TABLE transaction;

commit;

INSERT INTO transaction VALUES ('1230-901-0613-01',1,seq_transaction.nextval, 'test', 'test', 1230, sysdate, 'test','001');

select 
    my_account as myAccount
    , my_balance as myBalance
    , trans_no as transNo
    , trans_type as transType
    , target_name as targetName
    , trans_amount as transAmount
    , trans_date as transDate
    , target_account as targetAccount
    , target_bankcode as targetBankcode
from transaction where my_account = '1230-901-0613-01';
	