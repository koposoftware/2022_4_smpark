DROP TABLE join_saving;

CREATE TABLE join_saving
(
    join_no    number(5) not null,
    id    VARCHAR2(50) NOT NULL,
    saving_code    CHAR(2) NOT NULL,
    start_date    DATE DEFAULT sysdate,
    end_date    DATE,
    period    VARCHAR2(50),
    interest_rate    NUMBER(5,2),
    join_amount    NUMBER(10),
    collect_amount NUMBER(10) DEFAULT 0,
    account_num varchar2(50)
);

drop sequence seq_join_saving;
create SEQUENCE seq_join_saving nocache;
        
INSERT INTO join_saving(join_no,id,saving_code,start_date,end_date,period,interest_rate,join_amount,account_num)
    VALUES(seq_join_saving.nextval,'cjstk4_','01',sysdate,to_char(sysdate+INTERVAL '1' year,'YYYYMMDD'),'2аж', (select base_rate from saving where saving_code='01'),50000,'1230-901-0613-01');


commit;
select * from join_saving;

select * from saving;


