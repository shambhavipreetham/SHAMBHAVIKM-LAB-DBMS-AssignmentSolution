Create database if not exists e_commerce;
--------------------------------------------------------------------------------------
Create table if not exists supplier(
SUPP_ID int primary key,
SUPP_NAME varchar(50) NOT NULL,
SUPP_CITY varchar(50),
SUPP_PHONE varchar(10) NOT NULL);

Create table if not exists customer(
CUS_ID int primary key,
CUS_NAME varchar(20) NOT NULL,
CUS_PHONE varchar(10) NOT NULL,
CUS_CITY varchar(30) NOT NULL,
CUS_GENDER char);

Create table if not exists category(
CAT_ID int primary key,
CAT_NAME varchar(20) NOT NULL);

Create table if not exists product(
PRO_ID int primary key,
PRO_NAME varchar(20) NOT NULL,
PRO_DESC varchar(60),
CAT_ID int NOT NULL,
FOREIGN KEY(CAT_ID) REFERENCES category(CAT_ID));

Create table if not exists supplier_pricing(
PRICING_ID int primary key,
PRO_ID int NOT NULL,
SUPP_ID int NOT NULL,
SUPP_PRICE int DEFAULT 0,
FOREIGN KEY(PRO_ID) REFERENCES product(PRO_ID),
FOREIGN KEY(SUPP_ID) REFERENCES supplier(SUPP_ID));

Create table if not exists orders(
ORD_ID int primary key,
ORD_AMOUNT int NOT NULL, 
ORD_DATE date NOT NULL,
CUS_ID int,
PRICING_ID int,
FOREIGN KEY(CUS_ID) REFERENCES customer(CUS_ID),
FOREIGN KEY(PRICING_ID) REFERENCES supplier_pricing(PRICING_ID));

Create table if not exists rating(
RAT_ID int primary key,
ORD_ID int NOT NULL,
RAT_RATSTARS int NOT NULL,
FOREIGN KEY(ORD_ID) REFERENCES orders(ORD_ID));

----------------------------------------------------------------------------------------------------------------

insert into supplier values(1,'Rajesh Retails','Delhi','1234567890');
insert into supplier values(2,'Appario Ltd.','Mumbai','2589631470');
insert into supplier values(3,'Knome products','Banglore','9785462315');
insert into supplier values(4,'Bansal Retails','Kochi','8975463285');
insert into supplier values(5,'Mittal Ltd.','Lucknow','7898456532');

insert into customer values(1,'AAKASH', '9999999999', 'DELHI', 'M');
insert into customer values(2,'AMAN', '9785463215', 'NOIDA', 'M');
insert into customer values(3,'NEHA', '9999999999', 'MUMBAI', 'F');
insert into customer values(4,'MEGHA', '9994562399', 'KOLKATA', 'F');
insert into customer values(5,'PULKIT', '7895999999', 'LUCKNOW', 'M');

insert into category values(1,'BOOKS');
insert into category values(2,'GAMES');
insert into category values(3,'GROCERIES');
insert into category values(4,'ELECTRONICS');
insert into category values(5,'CLOTHES');

insert into product values(1,'GTA V','Windows 7 and above with i5 processor and 8GB RAM',2);
insert into product values(2,'TSHIRT','SIZE-L with Black, Blue and White variations',5);
insert into product values(3,'ROG LAPTOP','Windows 10 with 15inch screen, i7 processor, 1TB SSD',4);
insert into product values(4,'OATS','Highly Nutritious from Nestle',3);
insert into product values(5,'HARRY POTTER','Best Collection of all time by J.K Rowling',1);
insert into product values(6,'MILK','1L Toned MIlk',3);
insert into product values(7,'Boat Earphones','1.5Meter long Dolby Atmos',4);
insert into product values(8,'Jeans','Stretchable Denim Jeans with various sizes and color',5);
insert into product values(9,'Project IGI','compatible with windows 7 and above',2);
insert into product values(10,'Hoodie','Black GUCCI for 13 yrs and above',5);
insert into product values(11,'Rich Dad Poor Dad','Written by RObert Kiyosaki',1);
insert into product values(12,'Train Your Brain','By Shireen Stephen',1);

insert into supplier_pricing values(1,1,2,1500);
insert into supplier_pricing values(2,3,5,30000);
insert into supplier_pricing values(3,5,1,3000);
insert into supplier_pricing values(4,2,3,2500);
insert into supplier_pricing values(5,4,1,1000);
insert into supplier_pricing values(6,8,5,780);
insert into supplier_pricing values(7,12,4,789);
insert into supplier_pricing values(8,3,1,31000);
insert into supplier_pricing values(9,1,5,1450);
insert into supplier_pricing values(10,4,2,999);
insert into supplier_pricing values(11,7,3,549);
insert into supplier_pricing values(12,7,4,529);
insert into supplier_pricing values(13,6,2,105);
insert into supplier_pricing values(14,6,1,99);
insert into supplier_pricing values(15,2,5,2999);
insert into supplier_pricing values(16,5,2,2999);

insert into orders values(101,1500,'2021-10-06',2,1);
insert into orders values(102,1000,'2021-10-12',3,5);
insert into orders values(103,30000,'2021-09-16',5,2);
insert into orders values(104,1500,'2021-10-05',1,1);
insert into orders values(105,3000,'2021-08-16',4,3);
insert into orders values(106,1450,'2021-08-18',1,9);
insert into orders values(107,789,'2021-09-01',3,7);
insert into orders values(108,780,'2021-09-07',5,6);
insert into orders values(109,3000,'2021-00-10',5,3);
insert into orders values(110,2500,'2021-09-10',2,4);
insert into orders values(111,1000,'2021-09-15',4,5);
insert into orders values(112,789,'2021-09-16',4,7);
insert into orders values(113,31000,'2021-09-16',1,8);
insert into orders values(114,1000,'2021-09-16',3,5);
insert into orders values(115,3000,'2021-09-16',5,3);
insert into orders values(116,99,'2021-09-17',2,14);

insert into rating values(1,101,4);
insert into rating values(2,102,3);
insert into rating values(3,103,1);
insert into rating values(4,104,2);
insert into rating values(5,105,4);
insert into rating values(6,106,3);
insert into rating values(7,107,4);
insert into rating values(8,108,4);
insert into rating values(9,109,3);
insert into rating values(10,110,5);
insert into rating values(11,111,3);
insert into rating values(12,112,4);
insert into rating values(13,113,2);
insert into rating values(14,114,1);
insert into rating values(15,115,1);
insert into rating values(16,116,0);

-----------------------------------------------------------------------------------------------------------------

SELECT count(C.CUS_ID),C.CUS_GENDER FROM e_commerce.orders O INNER JOIN
customer C ON O.CUS_ID=C.CUS_ID WHERE O.ORD_AMOUNT>=3000 GROUP BY C.CUS_GENDER;

-----------------------------------------------------------------------------------------------------------------

SELECT O.ORD_ID, O.ORD_AMOUNT, O.ORD_DATE, P.PRO_NAME, C.CUS_NAME FROM orders O INNER JOIN
customer C ON O.CUS_ID=C.CUS_ID INNER JOIN supplier_pricing S ON O.PRICING_ID=S.PRICING_ID INNER JOIN
product P ON S.PRO_ID=P.PRO_ID WHERE C.CUS_ID=2;

-----------------------------------------------------------------------------------------------------------------

SELECT supplier.*FROM supplier WHERE supplier.SUPP_ID in
(SELECT SUPP_ID FROM supplier_pricing GROUP BY SUPP_ID HAVING count(SUPP_ID)>1)
GROUP BY supplier.SUPP_ID;

------------------------------------------------------------------------------------------------------------------

SELECT category.CAT_ID, category.CAT_NAME, min(a.min_price) as MIN_PRICE FROM category INNER JOIN
(SELECT product.CAT_ID, product.PRO_NAME, b.*FROM product INNER JOIN
(SELECT PRO_ID,min(SUPP_PRICE) as MIN_PRICE FROM supplier_pricing GROUP BY PRO_ID)
as b WHERE b.PRO_ID=product.PRO_ID)
as a WHERE a.CAT_ID=category.CAT_ID GROUP BY a.CAT_ID;

-------------------------------------------------------------------------------------------------------------------

SELECT *FROM orders O INNER JOIN
supplier_pricing SP ON O.PRICING_ID=SP.PRICING_ID WHERE
O.ORD_DATE>'2021-10-05';

--------------------------------------------------------------------------------------------------------------------

SELECT C.CUS_NAME, C.CUS_GENDER FROM customer C WHERE C.CUS_NAME LIKE 'A%' OR C.CUS_NAME LIKE'%A';

--------------------------------------------------------------------------------------------------------------------

DELIMITER &&
CREATE PROCEDURE proc()
BEGIN
SELECT S.SUPP_ID,S.SUPP_NAME,S.AVERAGE,
CASE
	WHEN S.AVERAGE = 5 THEN 'EXCELLENT SERVICE'
    WHEN S.AVERAGE > 4 THEN 'GOOD SERVICE'
    WHEN S.AVERAGE > 2 THEN 'AVERAGE SERVICE'
    ELSE 'POOR SERVICE'
END AS Type_of_Service from
(SELECT final.SUPP_ID, supplier.SUPP_NAME,final.AVERAGE FROM
(SELECT B.SUPP_ID, sum(B.RAT_RATSTARS)/count(B.RAT_RATSTARS) AS AVERAGE FROM
(SELECT supplier_pricing.SUPP_ID,T.ORD_ID,T.RAT_RATSTARS FROM supplier_pricing INNER JOIN 
(SELECT orders.PRICING_ID,rating.ORD_ID,rating.RAT_RATSTARS FROM orders INNER JOIN rating ON rating.ORD_ID=orders.ORD_ID) AS T
ON T.PRICING_ID=supplier_pricing.PRICING_ID)
AS B GROUP BY supplier_pricing.SUPP_ID)
AS final INNER JOIN supplier WHERE final.SUPP_ID=supplier.SUPP_ID) AS S;
END &&
DELIMITER ;

CALL proc(); 

-------------------------------------------------------------------------------------------------------------------------
