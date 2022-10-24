select * from join_saving;

select * from consume_list where consume_store like '%무신사%';

select * from saving;
select * from PRIME_RATE;

UPDATE saving set base_rate = 1.3;
commit;
INSERT INTO prime_rate VALUES (1.5, 1, '50000');
INSERT INTO prime_rate VALUES (2.0, 1, '200000');
INSERT INTO prime_rate VALUES (2.6, 1, '400000');
INSERT INTO prime_rate VALUES (3.2, 1, '600000');
INSERT INTO prime_rate VALUES (4.0, 1, '800000');
INSERT INTO prime_rate VALUES (5.0, 1, '1000000');

select * from consume_stats;

SUM(sal) OVER(ORDER BY empno) AS sal_sum;
SUM(sal) OVER(PARTITION BY job ORDER BY sal DESC, empno) AS sal_sum;
select sum(consume_amount), to_char(consume_date,'YYYY-MM') from consume_list where consume_store like '%무신사%' group by to_char(consume_date,'YYYY-MM');

select sum(consume_amount) over(order by to_char(consume_date,'YYYY-MM')),to_char(consume_date,'YYYY-MM') from consume_list where consume_store like '%무신사%';
select sum(consume_amount) ,sum(consume_amount) over(order by to_char(consume_date,'YYYY-MM')),to_char(consume_date,'YYYY-MM'), consume_date from consume_list 
where consume_store like '%무신사%' ;


select 
    consume_amount
    , sum(consume_amount) over(order by consume_date) as sumConsume
    , sum(consume_amount) over(order by to_char(consume_date,'YYYY-MM')) as 월별누적소비액
    , consume_date
    , id
    , case
        when sum(consume_amount) over(order by consume_date) <= 50000 then 1.5
        when sum(consume_amount) over(order by consume_date) <=  200000 then 2
        when sum(consume_amount) over(order by consume_date) <= 400000 then 2.6
        when sum(consume_amount) over(order by consume_date) <= 600000 then 3.2
        when sum(consume_amount) over(order by consume_date) <= 800000 then 4
        when sum(consume_amount) over(order by consume_date) <= 1000000 then 5
        end as primeRate
from consume_list where consume_store like '%무신사%';

UPDATE join_saving set interest_rate =  ;

select 
    start_date as startDate
    , end_date as endDate
    , period
    , interest_rate as interestRate
    , join_amount as joinAmount
    , collect_amount as collectAmount
    , account_num as accountNum
    , saving_code as savingCode
from join_saving where id= 'cjstk4_';



select s.start_date as startDate
    , s.end_date as endDate
    , s.period
    , s.interest_rate as interestRate
    , s.join_amount as joinAmount
    , s.collect_amount as collectAmount
    , s.account_num as accountNum
    , s.saving_code as savingCode
    , p.condition
from join_saving s, PRIME_RATE p ;

ALTER TABLE join_saving MODIFY saving_code2 number(5);

-- 새 컬럼을 생성 (기존 데이터를 옮겨담을 컬럼)
ALTER TABLE join_saving ADD saving_code2 number(5);
 
-- 새 컬럼에 기존 데이터를 입력 (SET)
UPDATE join_saving SET saving_code2 = saving_code;
 
-- 기존 컬럼 삭제
ALTER TABLE join_saving DROP COLUMN saving_code;
 
-- 새 컬럼의 이름을 기존 컬럼 이름으로 RENAME
ALTER TABLE join_saving RENAME COLUMN saving_code2 TO saving_code;

UPDATE join_saving SET saving_code = 1;
commit;