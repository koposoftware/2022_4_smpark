select * from challenge order by challenge_no desc;


TRUNCATE table consume_list;
TRUNCATE table consume_stats;
select * from consume_list;
select * from consume_stats;

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
			and EXTRACT(month from a.consume_date) = '9' 
			and EXTRACT(year from a.consume_date) =  '2022'
			and a.id = 'cjstk4_'
		group by 
			b.consume_category
			, b.consume_code
		order by 
			sum(a.consume_amount) desc;