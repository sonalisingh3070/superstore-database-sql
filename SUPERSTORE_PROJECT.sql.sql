CREATE DATABASE SUPERSTORE;
USE SUPERSTORE;
CREATE TABLE SALES(
Row_ID	SERIAL	PRIMARY KEY,
Order_ID	VARCHAR(100),	
Order_Date	DATE,	
Ship_Date	DATE,	
Ship_Mode	VARCHAR(50),	
Customer_ID	VARCHAR(100),	
Customer_Name	VARCHAR(150),	
Segment	VARCHAR(50),	
Country	VARCHAR(70),	
City	VARCHAR(70),	
State	VARCHAR(70),	
Postal_Code	INT,	
Region	VARCHAR(100),	
Product_ID	VARCHAR(100),	
Category	VARCHAR(100),	
Sub_Category	VARCHAR(100),	
Product_Name	VARCHAR(500),	
Sales	DECIMAL(10,2),	
Quantity	INT,	
Discount	DECIMAL(10,2),	
Profit	DECIMAL(10,2)
);	
----#1 Retrieve all records from dataset
SELECT*FROM SALES ;

----#2 Show unique Ship modes available
select distinct ship_mode from sales;

----#3 Count the total number of orders
select  count( distinct order_id) from sales;

----#4 Find the total number of unique customers
select  count( distinct customer_name) from sales;

----#5 List all product categories and their distinct sub-categories
select distinct sub_category,category from sales;

----#6 Get the total sales for the entire dataset
select sum(sales) from sales;

----#7 Find the minimun,maximum, and average profit
select max(profit) from sales;
select min(profit)from sales;
select avg(profit) from sales;

----#8 Show the first 10 orders sorted by Order Date
select *from sales order by order_date  limit 10;

----#9 Retrieve all orders from the "Furniture" category
select*from sales where category="Furniture";

----#10 Find how many orders were shipped using Second Class mode
select count(order_id) from sales where ship_mode="second class";

----#11 Get the top 10 customers by total sales
select customer_name,sum(sales) from sales 
group by customer_name order by sum(sales) desc limit 10;

----#12 Find the region-wise sales and profit
 select distinct region, sum(sales) over(partition by region) from sales ;
 select distinct region, sum(profit) over(partition by region) from sales ;
 
----#13 Show the state with the highest total sales
select state,sum(sales) as highest_sale from sales group by state order by sum(sales) desc limit 1; 

----#14 Calculate average discount given per category
select category,avg(discount) from sales group by category;

----#15 Retrieve all orders where Profit<0
select * from sales where profit<0;

----#16 Find the most sold sub-category by quantity
select sub_category,sum(quantity) from sales 
 group by sub_category order by sum(quantity)desc limit 1 ;
 
----#17 Calculate the number of orders placed per year
 select  Year(order_date) as order_year,count(order_id) as total_orders from sales
 group by year(order_date) order by order_year ;
 
----#18 Show the sales trend(monthly total sales)
 select month(order_date)as months,sum(sales) from sales
 group by month(order_date) order by months;

----#19 Find the top 5 cities contributing to profit
select city,profit from sales order by profit desc limit 5;

----#20 get the customer who placed highest number of orders
select customer_name,count(order_id)as total_orders from sales
 group by customer_name order by  count(order_id) desc limit 1;
 
 
