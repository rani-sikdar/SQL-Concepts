## RANK, LEAD, LAG FUNCTION & SUB-QUERIES

SELECT * FROM personal;

SELECT NAME, SURNAME, AGE, RANK() OVER(ORDER BY AGE DESC) AS RANK_AGE FROM personal;
SELECT NAME, SURNAME, AGE, dense_rank() OVER(ORDER BY AGE DESC) AS DENSE_RANK_AGE FROM personal;
SELECT NAME, SURNAME, AGE, row_number() OVER(ORDER BY AGE DESC) AS AGE_ROW_NUM FROM personal;

SELECT NAME, SURNAME, AGE, RANK() OVER(ORDER BY AGE DESC) AS RANK_AGE, 
dense_rank() OVER(ORDER BY AGE DESC) AS DENSE_RANK_AGE,
row_number() OVER(ORDER BY AGE DESC) AS AGE_ROW_NUM FROM personal;

SELECT NAME, SURNAME, AGE, REGION, RANK() OVER(PARTITION BY REGION ORDER BY AGE DESC) AS RANK_AGE, 
dense_rank() OVER(PARTITION BY REGION ORDER BY AGE DESC) AS DENSE_RANK_AGE,
row_number() OVER(PARTITION BY REGION ORDER BY AGE DESC) AS AGE_ROW_NUM FROM personal;

## LEAD & LAG FUNCTION
SELECT NAME, SURNAME, AGE, REGION, LEAD(AGE,2) OVER(PARTITION BY REGION ORDER BY AGE) AS LEAD_VALUE FROM PERSONAL;
SELECT NAME, SURNAME, AGE, REGION, LAG(AGE) OVER(PARTITION BY REGION ORDER BY AGE) AS LAG_VALUE FROM PERSONAL;


## SUBQUERIES
SELECT * FROM PERSONAL;
SELECT * FROM PROFESSIONAL;

select * from 
(select Name,age from personal) A;

select Name from 
(select Name,age from personal) A;

select Name,surname, age from personal
where Customer_ID in 
(
select Customer_ID from professional
);

select Name,surname, age from personal
where Customer_ID in 
(
select Customer_ID from professional 
where Job_Classification ='white collar'
);

/* I want to find out the average age of all the customers from personal table 
 with white collar jobs and Balance more than 50k from professional table */
 
 
 SELECT AVG(AGE) AS AVG_AGE FROM personal
 WHERE 
 Customer_ID IN 
 (
 SELECT Customer_ID FROM professional WHERE Job_Classification ='white collar'
 )
 AND 
 Customer_ID IN 
 (
 SELECT Customer_ID FROM professional WHERE BALANCE >50000
 );
 







