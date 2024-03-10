-- USE new_schema;
CREATE TABLE EMP(
EID CHAR (5),
NAME CHAR(20),
ADDRESS CHAR(30),
CITY CHAR(20),
DOB DATE,
PHONE VARCHAR(10),
EMAIL VARCHAR(50));

/* Start Writing Insert Command to insert data in EMP2 table */

INSERT INTO EMP values ("E0001", "Yash", "25 Oxford Street", "London","1995-12-25", 9435367326,"r.rs@gmail.com"),
("E0002", "Amit", "24 Broadlands Street", "Southampton","1995-06-25", 9435787326,"a.at@gmail.com"),
("E0003", "Reeta", "23 Regent Street", "Bristol","1996-12-16", 7432467326,"r.ra@gmail.com"),
("E0004", "Isha", "26 Baker Street", "London","1995-01-10", 7435367309,"i.ia@gmail.com"),
("E0005", "Shiva", "27 Station Street", "Birmingham","1992-03-05", 7435366750,"s.sa@gmail.com"),
("E0006", "Tarun", "55 Kings Street", "Cardiff","1995-10-25", 7435365678,"t.tn@gmail.com"),
("E0007", "Misha", "43 Station Street", "Birmingham","1994-10-29", 7435367987,"m.ma@gmail.com"),
("E0008", "Rohan", "78 Oxford Street", "London","1995-09-23", 7409367326,"r.rn@gmail.com"),
("E0009", "Abhishek", "75 College Street", "Cambridge","1995-11-14", 7435368765,"a.ak@gmail.com"),
("E0010", "Lokesh", "15 New Street", "Bath","1993-07-18", 7435986326,"l.lh@gmail.com");

SELECT * FROM EMP;
SELECT * FROM EMP LIMIT 5;

SET SQL_SAFE_UPDATES = 0;

UPDATE EMP
SET EMAIL ="y.yh@gmail.com" WHERE NAME = "Yash";

UPDATE EMP
SET NAME = "Kush", EMAIL = "k.kh@gmail.com"
WHERE CITY = "Cardiff";

SELECT EID, NAME, CITY, DOB AS "DATE_OF_BIRTH", PHONE FROM EMP;
SELECT * FROM EMP;

ALTER TABLE EMP
ADD SURNAME VARCHAR(50);

SELECT * FROM EMP;

ALTER TABLE EMP
MODIFY COLUMN PHONE CHAR(20);

ALTER TABLE EMP
MODIFY COLUMN PHONE VARCHAR(10);

DESC EMP;

ALTER TABLE EMP
DROP COLUMN SURNAME;

SELECT * FROM EMP;

/* SESSION AFTER BREAK */

SET AUTOCOMMIT =0;
DELETE FROM EMP WHERE CITY= "Bath";

SELECT * FROM EMP;

TRUNCATE TABLE EMP;
COMMIT;

DELETE FROM EMP;

DELETE FROM EMP WHERE CITY = "Bristol";
COMMIT;

DELETE FROM EMP WHERE CITY = "Bath";

ROLLBACK;


-- OPERATORS
SELECT * FROM EMP
WHERE EMAIL IN ("r.ra@gmail.com","m.ma@gmail.com");

select count(*) from emp;

select DISTINCT(CITY) FROM EMP;

select * from emp limit 5;

set sql_safe_updates = 0;

UPDATE EMP
SET EMAIL ="y.yh@gmail.com" WHERE NAME = "Yash";

UPDATE EMP
SET NAME = "Kush", EMAIL = "k.kh@gmail.com"
WHERE CITY = "Cardiff";

select * from emp;

SELECT EID, NAME, CITY, DOB AS "DATE_OF_BIRTH", PHONE FROM EMP;

ALTER TABLE EMP
ADD SURNAME varchar(50);  

-- select * FROM EMP;

ALTER TABLE EMP
MODIFY COLUMN PHONE CHAR(20);

ALTER TABLE EMP
MODIFY COLUMN PHONE VARCHAR(10);

-- DESC EMP;

ALTER TABLE EMP
DROP COLUMN SURNAME;

delete from emp WHERE CITY= 'Bath';

SELECT * FROM EMP;

/* truncate(at once) vs delete(one by one row) vs drop */
set AUTOCOMIT= 0;
DELETE FROM EMP WHERE CITY = "Bristol";
COMMIT;

DELETE FROM EMP WHERE CITY = "Bath";
commit; 
select * from emp;

ROLLBACK;

select * from emp;

-- OPERATORS
SELECT * FROM EMP
WHERE EMAIL IN ('r.ra@gmail.com',"y.yh@gmail.com");

select count(*) from emp;

select distinct(city), name from emp;

select * from emp;














