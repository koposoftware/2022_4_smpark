DROP TABLE consume_stats;
CREATE TABLE consume_stats 
(
    consume_category    VARCHAR2(100) not null,
    consume_sum         number(10) not null,
    consume_date        date    not null,
    CONSUME_RATE        VARCHAR2(50) NOT NULL,
    CONSUME_DIFFERENCE  NUMBER(10) NOT NULL,
    ID                  VARCHAR2(50) NOT NULL
);
select * from consume_stats;
commit;
select 
			b.consume_category as category
			, b.consume_code as categoryCode
			, sum(a.consume_amount) as sum
			, DENSE_RANK() OVER(ORDER BY sum(a.consume_amount) desc) as rank
		from 
			consume_list a
			, consume_category b 
		where 1=1
			and a.CONSUME_CODE = b.CONSUME_CODE
			and EXTRACT(month from a.consume_date) = '09' 
			and EXTRACT(year from a.consume_date) = '2022'
			and a.id = 'cjstk4_'
		group by 
			b.consume_category
			, b.consume_code
		order by 
			sum(a.consume_amount) desc;


