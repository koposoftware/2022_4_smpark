-- 7�� �Һ� 
select b.consume_category as category, a.consume_amount from consume_list a, consume_category b 
where EXTRACT(month from a.consume_date) = '7' and a.CONSUME_CODE = b.CONSUME_CODE order by a.consume_date asc;

-- 8�� �Һ� 
select b.consume_category as category, a.consume_amount from consume_list a, consume_category b 
where EXTRACT(month from a.consume_date) = '8' and a.CONSUME_CODE = b.CONSUME_CODE order by a.consume_date asc;

-- 7�� �Һ� ���� �� 
select b.consume_category as category,  to_char(sum(a.consume_amount),'9,999,999') as sum, DENSE_RANK() OVER(ORDER BY sum(a.consume_amount) desc) as rank from consume_list a, consume_category b 
where EXTRACT(month from a.consume_date) = '7' and a.CONSUME_CODE = b.CONSUME_CODE and a.id = 'cjstk4_'  group by b.consume_category order by sum(a.consume_amount) desc;

-- 8�� �Һ� ���� �� 
select b.consume_category as category,  sum(a.consume_amount) as sum, DENSE_RANK() OVER(ORDER BY sum(a.consume_amount) desc) as rank from consume_list a, consume_category b 
where EXTRACT(month from a.consume_date) = '8' and a.CONSUME_CODE = b.CONSUME_CODE and a.id= 'cjstk4_'  group by b.consume_category order by sum(a.consume_amount) desc;

--7�� ���� ���� �Һ��� �� 
select to_char(consume_date,'YYYY-MM-DD') as category,  TO_CHAR(sum(consume_amount), '9,999,999') as sum, DENSE_RANK() OVER(ORDER BY sum(consume_amount) desc) as rank from consume_list
where EXTRACT(month from consume_date) = '7' and id= 'cjstk4_'  group by consume_date;

--8�� ���� ���� �Һ��� �� 
select consume_date as category,  sum(consume_amount) as sum, DENSE_RANK() OVER(ORDER BY sum(consume_amount) desc) as rank from consume_list
where EXTRACT(month from consume_date) = '8' and id= 'cjstk4_'  group by consume_date;

--7�� ���� ���� �ݾ��� �� ����
select consume_store, consume_amount, DENSE_RANK() OVER(ORDER BY consume_amount desc) as rank from consume_list
where EXTRACT(month from consume_date) = '7' and id= 'cjstk4_'  group by consume_store, consume_amount;

--8�� ���� ���� �ݾ��� �� ����
select consume_store, to_char(consume_amount,'9,999,999'), DENSE_RANK() OVER(ORDER BY consume_amount desc) as rank from consume_list
where EXTRACT(month from consume_date) = '8' and EXTRACT(year from consume_date) =  '2022' and id= 'cjstk4_'  group by consume_store, consume_amount;



-- ���� ���� ���� �Һ��� �� 
select to_char(consume_date,'MM')||'�� '||to_char(consume_date,'DD')||'�� '||'('|| to_char(consume_date,'dy')||')' as consume_date, 
        to_char(sum(consume_amount), '9,999,999') as amount, 
		DENSE_RANK() OVER(ORDER BY sum(consume_amount) desc) as rank from consume_list
		where EXTRACT(month from consume_date) = '7' and EXTRACT(year from consume_date) =  '2022' and 
		id= 'cjstk4_' group by consume_date;
        
 select b.consume_category as category,  to_char(sum(a.consume_amount),'9,999,999') as sum, DENSE_RANK() OVER(ORDER BY sum(a.consume_amount) desc) as rank from consume_list a, consume_category b 
where EXTRACT(month from a.consume_date) = '7' and a.CONSUME_CODE = b.CONSUME_CODE and a.id = 'cjstk4_'  group by b.consume_category order by sum(a.consume_amount) desc;


select b.consume_category as category,  sum(a.consume_amount) as sum from consume_list a, consume_category b 
where EXTRACT(month from a.consume_date) = '7' and a.CONSUME_CODE = b.CONSUME_CODE and a.id = 'cjstk4_'  group by b.consume_category order by sum(a.consume_amount) desc;
        
-- ���� ��� �Һ� �ݾ� ���� (6-7��) 

select b.consume_category as category,  sum(a.consume_amount) as sum, to_char(extract(month from a.consume_date),'09') from consume_list a, consume_category b 
where a.CONSUME_CODE = b.CONSUME_CODE and a.id = 'cjstk4_'  group by b.consume_category, extract(month from a.consume_date) order by consume_category desc;

truncate table consume_list;

commit;

select * from consume_list;

DROP SEQUENCE seq_consume_no;

CREATE SEQUENCE seq_consume_no;
