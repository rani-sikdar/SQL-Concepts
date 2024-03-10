SELECT * FROM PERSONAL;
SELECT * FROM PROFESSIONAL;

#INNER JOIN---
SELECT PERSONAL.CUSTOMER_ID, PERSONAL.NAME , PERSONAL.SURNAME, professional.Balance
FROM personal
inner join professional
on personal.Customer_ID = professional.Customer_ID;


-- INNER JOIN WITH ALIAS NAME
SELECT A.CUSTOMER_ID, A.NAME , A.SURNAME, B.Balance
FROM personal A
inner join professional B
on A.Customer_ID = B.Customer_ID;

-- LEFT JOIN 
SELECT A.CUSTOMER_ID, A.NAME , A.SURNAME,B.Job_Classification, B.Balance
FROM personal A
LEFT join professional B
on A.Customer_ID = B.Customer_ID;

-- RIGHT JOIN 
SELECT A.CUSTOMER_ID, A.NAME , A.SURNAME,B.Customer_ID, B.Job_Classification,	 B.Balance
FROM personal A
right join professional B
on A.Customer_ID = B.Customer_ID;

## cartessian JOIN 
SELECT *
FROM personal A
cross join professional B;

## self JOIN 
SELECT  A.CUSTOMER_ID, A.NAME , A.SURNAME, A.AGE, b.NAME,B.Surname,B.AGE , B.Joint_Acc_ID
FROM personal A
join personal B
ON  A.Customer_ID = B.Joint_Acc_ID;







