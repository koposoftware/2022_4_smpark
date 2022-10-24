select * from saving ;
select * from consume_category;
select * from consume_category;

ALTER TABLE saving RENAME COLUMN cosume_code TO consume_code;
UPDATE saving SET consume_code = '01';

select 
    s.saving_name as savingName
    , j.start_date as startDate
    , j.end_date as endDate
    , j.period as period
    , c.consume_category as consumeCategory
    , j.interest_rate as interestRate
    , j.join_amount as joinAmount
    , j.collect_amount as collectAmount
    , j.id as id
from join_saving j, saving s, consume_category c
    where s.saving_code =  j.saving_code and c.consume_code = s.consume_code;
    
select * from account;
select 
    account_num as accountNum
    , balance
    , account_name as accountName
from account
    where account_type='01' and id = 'cjstk4_';
    
SELECT * FROM JOIN_SAVING;