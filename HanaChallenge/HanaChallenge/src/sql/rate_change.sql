-- 우대금리 변경 테이블

DROP TABLE rate_change;

CREATE TABLE rate_change
(
    id    VARCHAR2(50) NOT NULL,
    change_date    DATE,
    consume    NUMBER(10),
    sum_consume    NUMBER(10) NOT NULL,
    prime_rate    NUMBER(5,2) NOT NULL,
    saving_name     VARCHAR2(500) not null,
    saving_code     number(5),
    consume_code    char(2)
);


-- 무신사 우대금리 변경 내역
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