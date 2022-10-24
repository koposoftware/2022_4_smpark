select * from join_saving;

select 
    id
    , j.saving_code as savingCode
    , j.start_date as startDate
    , j.end_date as endDate
    , j.period
    , j.interest_rate as interestRate
    , j.join_amount as joinAmount
    , j.collect_amount as collectAmount
    , j.account_num as accountNum
    , j.join_no as joinNo
    , s.consume_code as consumeCode
from join_saving j, saving s where j.saving_code = s.saving_code and j.id='cjstk4_';

select * from saving;