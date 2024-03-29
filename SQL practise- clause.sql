use new_schema;
select * from bank_customers;
select * from personal;
select * from professional;


# UNION CLAUSE
SELECT CUSTOMER_ID , NAME, SURNAME
FROM bank_customers 
UNION ALL
SELECT CUSTOMER_ID , NAME, SURNAME
FROM personal;

# UNION CLAUSE
SELECT CUSTOMER_ID , NAME, SURNAME
FROM bank_customers 
UNION
SELECT CUSTOMER_ID , NAME, SURNAME
FROM personal;

# UNION ALL CLAUSE
SELECT CUSTOMER_ID , NAME, SURNAME
FROM bank_customers 
UNION ALL
SELECT CUSTOMER_ID , NAME, SURNAME
FROM personal;

# DIFFRENTIATING RECORDS FROM SECOND TABLE
SELECT CUSTOMER_ID , NAME, SURNAME, 100 AS CODE
FROM bank_customers 
UNION 
SELECT CUSTOMER_ID , NAME, SURNAME, 200 AS CODE
FROM personal;

## COMBINING 2 OR MORE TABLES WITH SAME TABLES
SELECT CUSTOMER_ID , NAME, SURNAME, REGION, 'ENG-BANK_CUS' AS CODE_REGION 
FROM bank_customers
WHERE REGION= 'ENGLAND'
UNION
SELECT CUSTOMER_ID , NAME, SURNAME, REGION, 'SCO-BANK_CUS' AS CODE_REGION 
FROM bank_customers
WHERE REGION= 'SCOTLAND';

## COMBINING 2 OR MORE TABLES AND ONE WITH SAME TABLE
SELECT CUSTOMER_ID , NAME, SURNAME, REGION, 'ENG-BANK_CUS' AS CODE_REGION 
FROM bank_customers
WHERE REGION= 'ENGLAND'
UNION
SELECT CUSTOMER_ID , NAME, SURNAME, REGION, 'SCO-BANK_CUS' AS CODE_REGION 
FROM bank_customers
WHERE REGION= 'SCOTLAND'
UNION
SELECT CUSTOMER_ID, NAME, SURNAME, REGION,'WAL-PERS' AS CODE_REGION 
FROM PERSONAL
WHERE REGION = 'WALES';

## SPECIAL CASE FOR FULL OUTER JOIN USING UNION
SELECT A.CUSTOMER_ID , A.NAME, A.SURNAME, B.BALANCE, 100 AS CODE
FROM personal A
LEFT JOIN professional B
ON A.Customer_ID = B.Customer_ID
UNION
SELECT A.CUSTOMER_ID, A.NAME, A.SURNAME, B.BALANCE, 200 AS CODE
FROM PERSONAL A
RIGHT JOIN PROFESSIONAL B
ON A.Customer_ID = B.Customer_ID;

## CREATING VIEWS
SELECT * FROM personal;

CREATE VIEW PERSONAL_VIEW 
AS
SELECT CUSTOMER_ID, NAME, SURNAME, AGE 
FROM personal
where AGE >30;

SELECT * FROM PERSONAL_VIEW;

SELECT A.CUSTOMER_ID, A.NAME, A.AGE 
FROM personal_view A
RIGHT JOIN PERSONAL B
ON A.CUSTOMER_ID = B.CUSTOMER_ID;

INSERT INTO personal_view
VALUES ('300000006', 'Ava', 'Coleman', 31);

SELECT * FROM personal_view;
DROP VIEW personal_view;

SELECT * FROM personal_view; -- ERROR WILL THROW

CREATE VIEW PER_PROF_VIEW
AS
SELECT A.CUSTOMER_ID, A.NAME, A.SURNAME, A.AGE, B.JOB_CLASSIFICATION, B.BALANCE 
FROM PERSONAL A 
LEFT JOIN PROFESSIONAL B
ON A.CUSTOMER_ID = B.CUSTOMER_ID;

select * from PER_PROF_VIEW;

SELECT * FROM PER_PROF_VIEW WHERE AGE >30;

### SQL FUNCTIONS

SELECT count(*), COUNT(CUSTOMER_ID), COUNT(2) FROM personal;  ## COUNT(2) IS SECOND COLUMN

SELECT MAX(AGE) AS MAX_AGE, MIN(AGE) AS MIN_AGE, SUM(AGE) AS SUM_AGE, SQRT(SUM(AGE)) AS SQRT_AGE FROM PERSONAL;

SELECT CUSTOMER_ID, CONCAT(NAME, ' ', SURNAME) AS FULL_NAME FROM PERSONAL;

SELECT ASCII('B');

SELECT LEFT('Westbrook', 4);

SELECT RIGHT('ENGLAND', 4) AS QUREY_VAL;

SELECT LOCATE ('l', 'elephant') AS LOCATE_VAL;

select LENGTH('elephant') AS LENGTH_VAL;

SELECT LOWER('SAMuel') AS lOWER_VAL , UPPER('SAMuel') AS UPPER_VAL ;

SELECT TRIM('     SAMUEL    ') AS TRIM_VAL, LTRIM('     SAMUEL    ') AS LTRIM_VAL, RTRIM('     SAMUEL    ') AS RTRIM_VAL, LOWER(REVERSE('SAMuel')) AS REVERSE_VAL;

SELECT SUBSTRING('WORLD', 1,3);

SELECT REPLACE('WORLD@', '@','');

-- SELECT STUFF('ABCDEFGH',2,4,'IJK'); ##DOESN'T WORK IN MYSQL

SELECT REPLACE('ABCDEFGH','BCD','XYZ9@');
