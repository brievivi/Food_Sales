CREATE DATABASE food_sales;
USE foods_sales;
CREATE TABLE foods (
ID int,
Date int,
Region varchar(225),
City varchar(225),
Category varchar(225),
Product varchar(225),
Qty int,
UnitPri int,
TotalPri int);
SELECT *
FROM food_sales.book;

SELECT COUNT(ID)
FROM food_sales.book; /*244*/

SELECT TotalPrice, ID
FROM food_sales.book
WHERE TotalPrice > 100;
SELECT COUNT(TotalPrice)
FROM food_sales.book
WHERE TotalPrice > 100; /*125*/

SELECT 125/244*100; /* 51.23% of the sales are over $100 */

/*looking into popular cities among the sample*/
SELECT city, COUNT(*)
FROM food_sales.book
GROUP BY city
ORDER BY count(*) DESC;

SELECT region, COUNT(*)
FROM food_sales.book
GROUP BY region;

SELECT city, SUM(TotalPrice)
FROM food_sales.book
GROUP BY city
ORDER BY SUM(TotalPrice) DESC;

SELECT MAX(TotalPrice) AS HighestPrice, city
FROM food_sales.book
GROUP BY city
ORDER BY HighestPrice desc;
/*Boston is the most popular city, with the most food sales and highest amount sold in Los Angeles*/

SELECT Product, COUNT(*)
FROM food_sales.book
GROUP BY Product;
/*Carrots are the most popular product*/

/*Finding out when the most popular month for sales is*/
SELECT COUNT(Date)
from food_sales.book
WHERE right(Date, 3)='Jan'; /*21*/
SELECT COUNT(Date)
from food_sales.book
WHERE right(Date, 3)='Feb'; /*19*/
SELECT COUNT(Date)
from food_sales.book
WHERE right(Date, 3)='Mar'; /*20*/
SELECT COUNT(Date)
from food_sales.book
WHERE right(Date, 3)='Apr'; /*20*/
SELECT COUNT(Date)
from food_sales.book
WHERE right(Date, 3)='May'; /*22*/
SELECT COUNT(Date)
from food_sales.book
WHERE right(Date, 3)='Jun'; /*20*/
SELECT COUNT(Date)
from food_sales.book
WHERE right(Date, 3)='Jul'; /*20*/
SELECT COUNT(Date)
from food_sales.book
WHERE right(Date, 3)='Aug'; /*20*/
SELECT COUNT(Date)
from food_sales.book
WHERE right(Date, 3)='Sep'; /*20*/
SELECT COUNT(Date)
from food_sales.book
WHERE right(Date, 3)='Oct'; /*22*/
SELECT COUNT(Date)
from food_sales.book
WHERE right(Date, 3)='Nov'; /*20*/
SELECT COUNT(Date)
from food_sales.book
WHERE right(Date, 3)='Dec'; /*20*/
/*May and October are the most popular months*/


/*Another way to find the most popular date...*/
SELECT Date,
COUNT(
CASE
	when right(Date, 3)='Jan' then 'January'
    when right(Date, 3) ='Feb' then 'February'
    when right(Date, 3)='Mar' then 'March'
    when right(Date, 3)='Apr' then 'April'
    when right(Date, 3)='May' then 'May'
    when right(Date, 3)='Jun' then 'June'
    when right(Date, 3)='Jul' then 'July'
    when right(Date, 3)='Aug' then 'August'
    when right(Date, 3)='Sep' then 'September'
    when right(Date, 3)='Oct' then 'October'
    when right(Date, 3)='Nov' then 'November'
    when right(Date, 3)='Dec' then 'Decemeber'
    ELSE 'No date'
END)
FROM food_sales.book
GROUP BY Date;

/*Looking at the categories and prices*/
SELECT Category,
COUNT(*) as total_count,
ROUND(AVG(TotalPrice)) AS avg_price,
MAX(TotalPrice) AS max_price,
MIN(TotalPrice) AS min_price
FROM food_sales.book
GROUP BY Category; 
