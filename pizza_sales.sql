# 1: KPI'S for Total Revenue
Select sum(total_price) as Total_revenue
from pizza_sales;

# 2: Average order

with total_orders as (

 Select  count( distinct order_id) as tcount from pizza_sales),
 
Total_revenue as(
Select sum(total_price) as Total_rev
from pizza_sales),
Average_order as
 (
 Select
 round(Total_rev/tcount,2 )as avg_order from total_orders,Total_revenue
         ) 
SELECT * 
FROM average_order;

#3: total pizza sold

Select Sum(quantity) as total_pizza_sold
from pizza_sales;

#5. Average Pizza sold per order 

with total_count as(

select sum(quantity) as total_quantity
from pizza_sales
),

Total_count2  as ( 
Select count(distinct order_id) as total_c
from pizza_sales) ,

AvgO as ( select total_quantity/total_c from total_count ,total_count2)

select *
from avgO ;

# 6. Daily trent for total orders
SELECT 
    DAYOFWEEK(order_date) AS day_number,
    DAYNAME(order_date) AS day_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY day_number, day_name
ORDER BY day_number;

# 7. Month trend for total orders
SELECT 
    MONTH(order_date) AS month_number,
    MONTHNAME(order_date) AS month_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY month_number, month_name
ORDER BY month_number;



# 8. % of Sales Pizza by caltegory 
with Pizza_category as (
Select  pizza_category, sum(total_price) as Tp
from pizza_sales
group by pizza_category 
) ,
total_sales as (
 Select sum(total_price) as Ts
from pizza_sales) ,

percentage_sales as (  
select   pizza_category,
 (Tp/Ts)*100  as ps
 from Pizza_category ,total_sales
)
Select  pizza_category , ps as sales
from percentage_sales ;

#9: % of Sales by Pizza Size

with pizza_size as (
Select  pizza_size, sum(total_price) as Pz
from pizza_sales
group by pizza_size
) ,
total_sales as (
 Select sum(total_price) as Ts
from pizza_sales) ,

percentage_sales as (  
select   pizza_size ,
 (Pz/Ts)*100  as ps
 from pizza_size ,total_sales
)
Select  pizza_size , ps as percentage_sales
from percentage_sales ;

# 10. Top 5 Pizzas by Revenue
Select pizza_name , sum(total_price) as total_price
from pizza_sales
group by pizza_name
order by  total_price Desc
limit 5;


# 11. Bottom 5 Pizzas by Revenue
Select pizza_name , sum(total_price) as total_price
from pizza_sales
group by pizza_name
order by  total_price 
limit 5;

# 12. Top 5 Pizzas by Quantity
Select pizza_name , sum(quantity) as qnt_ordered
from pizza_sales
group by pizza_name
order by qnt_ordered desc
limit 5;

#  13. Bottom 5 Pizzas by Quantity
Select pizza_name , sum(quantity) as qnt_ordered
from pizza_sales
group by pizza_name
order by qnt_ordered 
limit 5;

# 14. Top 5 Pizzas by Total Orders
Select pizza_name , count(distinct order_id) as total_ordered
from pizza_sales
group by pizza_name
order by total_ordered  desc
limit 5;

# 15. bottom  5 Pizzas by Total Orders
Select pizza_name , count(distinct order_id) as total_ordered
from pizza_sales
group by pizza_name
order by total_ordered  asc
limit 5;











