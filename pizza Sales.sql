use pizza_db;
select * from pizza_sales;
select count(pizza_id) from pizza_sales;


select sum(total_price) as Total_Revenue from pizza_sales;

 select sum(quantity) as Total_Pizza_Sold from pizza_sales;
 
 select count(distinct order_id) as Order_places from pizza_sales;
 
 select sum(quantity)/count(distinct order_id) as Avg_pizza_orders from pizza_sales;
 
 
SELECT dayname(order_date)as order_day, count(distinct order_id) as Total_orders from 
pizza_sales
group by dayname(order_date);  

DESCRIBE pizza_sales;

UPDATE pizza_sales
SET order_date_dt = STR_TO_DATE(order_date, '%d-%m-%Y')
WHERE order_id IS NOT NULL;

SELECT 
    DAYNAME(order_date_dt) AS order_day,
    COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DAYNAME(order_date_dt);

SELECT 
    monthname(order_date_dt) AS Month_order,
    COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY monthname(order_date_dt);

select * from pizza_sales;

select pizza_category,sum(total_price) as Total_sales, sum(total_price)*100/(select sum(total_price) from pizza_sales where month(order_date_dt)=1)  as Total_sales
from pizza_sales
where month(order_date_dt)=1
group by pizza_category;

select pizza_size,sum(total_price) as Total_sales, sum(total_price)*100/(select sum(total_price) from pizza_sales)  as Total_sales
from pizza_sales
group by pizza_size
order by pizza_size desc;

select * from pizza_sales;

select  pizza_name , sum(total_price) as Total_Revenue from pizza_sales
group by pizza_name
order by Total_Revenue desc
limit 5;

select  pizza_name , sum(quantity) as Total_Pizza_Sold from pizza_sales
group by pizza_name
order by  sum(quantity) desc
limit 5;

select  pizza_name , count(distinct order_id) as Total_orders from pizza_sales
group by pizza_name
order by  Total_orders desc
limit 5;