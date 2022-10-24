DROP TABLE saving;

CREATE TABLE saving
(
    saving_code    number(5) NOT NULL,
    saving_name    VARCHAR2(500) NOT NULL,
    saving_detail    VARCHAR2(2000),
    min_amount    NUMBER(10),
    max_amount    NUMBER(10),
    min_age    NUMBER(5),
    max_age    NUMBER(5),
    consume_code    CHAR(2) NOT NULL,
    min_period    VARCHAR2(100),
    max_period    VARCHAR2(100),
    base_rate    NUMBER(5,2)
);

drop sequence seq_saving;
create SEQUENCE seq_saving nocache;

INSERT INTO saving(saving_code,saving_name,saving_detail,min_amount,max_amount,min_age,max_age,consume_code,min_period,max_period,base_rate)
    VALUES(seq_saving.nextval,'���Ż� ���� ����','���Ż� ����',1000,500000,14,100,'02','3����','1��',1.50);
INSERT INTO saving(saving_code,saving_name,saving_detail,min_amount,max_amount,min_age,max_age,consume_code,min_period,max_period,base_rate)
    VALUES(seq_saving.nextval,'�ø��꿵 ���� ����','�ø��꿵 ����',1000,500000,14,100,'02','3����','1��',1.50);
INSERT INTO saving(saving_code,saving_name,saving_detail,min_amount,max_amount,min_age,max_age,consume_code,min_period,max_period,base_rate)
    VALUES(seq_saving.nextval,'���̺� ���� ����','���̺� ����',1000,500000,14,100,'02','3����','1��',1.30);
INSERT INTO saving(saving_code,saving_name,saving_detail,min_amount,max_amount,min_age,max_age,consume_code,min_period,max_period,base_rate)
    VALUES(seq_saving.nextval,'Ʈ���� ���� ����','Ʈ���� ����',1000,500000,14,100,'02','3����','1��',1.30);
    
COMMIT;

SELECT 
	    saving_code as savingCode
	    , saving_name as savingName
	    , saving_detail as savingDetail
	    , consume_code as consumeCode
	    , min_period as minPeriod 
	    , max_period as maxPeriod
	    , base_rate as baseRate
	FROM SAVING;

SELECT * FROM SAVING;