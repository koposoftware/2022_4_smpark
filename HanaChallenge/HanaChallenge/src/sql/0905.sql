select 
	    substr(account_num,-2) as accountNum
	from account
    	where id = 'cjstk4_';
        
select * from join_saving;

UPDATE join_saving SET collect_amount = 245000 where join_no = 2; 

rollback;

select * from account;
select * from join_saving;

UPDATE join_saving
  SET start_date = '2022-07-05' where join_no = 2;
UPDATE join_saving
  SET end_date = '2023-07-05' where join_no = 2;
UPDATE join_saving
  SET period = '매주' where join_amount = 7;
UPDATE join_saving
  SET join_amount = 50000 where join_no = 2;
UPDATE join_saving
  SET collect_amount = 500000 where join_no = 2;
  
  commit;

update TRANSACTION
    set trans_type = '입금';
  select * from transaction;
  
  