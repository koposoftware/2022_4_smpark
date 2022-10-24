select * from consume_stats;

select add_months(to_date('2022-08-23','YYYY-MM-DD'),-1) prev_month from dual;

select add_months (to_date('consume_date','YYYY-MM-DD'),-1) prve_month from consume_stats where CONSUME_DATE between '202207' and '202208';

select  EXTRACT(month from consume_date)-1 from consume_stats;

SELECT CONSUME_CATEGORY AS CATEGORY, TO_CHAR(CONSUME_SUM,'9,999,999') AS SUM, CONSUME_RATE||'%' AS RATE, TO_CHAR(CONSUME_DIFFERENCE,'9,999,999') AS DIFFERENCE  
FROM CONSUME_STATS
WHERE EXTRACT(month from consume_DATE) = '7'
    and EXTRACT(year from consume_date) =  '2022' and id= 'cjstk4_' and CONSUME_DIFFERENCE < 0;
    
