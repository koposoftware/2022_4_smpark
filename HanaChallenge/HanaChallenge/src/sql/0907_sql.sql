-- 무신사 소비 금액 별 우대 금리 변화

select 
    c.consume_amount
    , sum(c.consume_amount) over(order by c.consume_date) as sumConsume
    , sum(c.consume_amount) over(order by to_char(c.consume_date,'YYYY-MM')) as 월별누적소비액
    , consume_date
    , id
    , case
        when sum(c.consume_amount) over(order by c.consume_date) <= 50000 then 1.5
        when sum(c.consume_amount) over(order by c.consume_date) <=  200000 then 2
        when sum(c.consume_amount) over(order by c.consume_date) <= 400000 then 2.6
        when sum(c.consume_amount) over(order by c.consume_date) <= 600000 then 3.2
        when sum(c.consume_amount) over(order by c.consume_date) <= 800000 then 4
        when sum(c.consume_amount) over(order by c.consume_date) <= 1000000 then 5
        end as primeRate
    , s.saving_name
    , s. saving_code
    , s.consume_code
from consume_list c, saving s 
where substr(c.consume_store,6,3) = SUBSTR(s.saving_name,0,3) and c.consume_store like '%무신사%';


select * from saving;
select * from consume_list;
INSERT INTO consume_list VALUES (seq_consume_no.nextval,	12450, 	'2022-09-30',	'주식회사 무신사',	'01',	'cjstk4_');
delete from consume_list where consume_date = '2022-09-30';

INSERT INTO rate_change select c.id, c.consume_date, c.consume_amount, sum(c.consume_amount) over(order by c.consume_date), 
        case
        when sum(c.consume_amount) over(order by c.consume_date) <= 50000 then 1.5
        when sum(c.consume_amount) over(order by c.consume_date) <=  200000 then 2
        when sum(c.consume_amount) over(order by c.consume_date) <= 400000 then 2.6
        when sum(c.consume_amount) over(order by c.consume_date) <= 600000 then 3.2
        when sum(c.consume_amount) over(order by c.consume_date) <= 800000 then 4
        when sum(c.consume_amount) over(order by c.consume_date) <= 1000000 then 5
        end as primeRate
    , s.saving_name
    , s. saving_code
    , s.consume_code
from consume_list c, saving s 
where substr(c.consume_store,6,3) = SUBSTR(s.saving_name,0,3) and c.consume_store like '%무신사%';
rollback;
commit;

select * from rate_change;
TRUNCATE table rate_change;

select to_char(change_date,'YYYY-MM'), consume, sum_consume, prime_rate from rate_change;