-- Monthly Revenue:
# 1) Write a query to calculate the total revenue generated each month.
select * from orders;

select sum(order_amount) as Total_Revenue, 
       extract(month from order_date) as Month
from orders 
group by extract(month from order_date) 
order by month;

-- Monthly Order Volume:
# 2) Get the total number of unique orders placed in each month.
SELECT distinct  extract(month from order_date) as Month,
                 count(order_id) as Unique_Order
FROM orders 
GROUP BY extract(month from order_date)
ORDER BY month;

-- Highest Revenue Month:
# 3) Identify the month that generated the highest revenue.
select extract(month from order_date) as Month, 
       sum(order_amount) as Highest_Revenue
from orders
group by extract(month from order_date)
order by Highest_Revenue desc
limit 1;

-- Monthly Revenue and Volume:
# 4) Get the total revenue and order volume for each month.
select extract(month from order_date) as Month,
       sum(order_amount) as Total_Revenue,
	   count(distinct order_id) as Order_Volume
from orders
group by extract(month from order_date)
order by month;


-- Year-wise Revenue Summary:
# 5) Calculate the total revenue per year.
select extract(year from order_date) as Year,
       sum(order_amount) as Total_Revenue
from orders
group by extract(year from order_date)
order by year;


-- Monthly Revenue with Year:
# 6) Show revenue grouped by year and month.
select extract(year from order_date) as Year,
       extract(month from order_date) as Month,
       sum(order_amount) as Revenue
from orders
group by extract(year from order_date), extract(month from order_date)
order by year, month;


-- Most Frequently Ordered Product per Month:
# 7) Find the product ordered most often in each month. (Optional use of window functions if allowed)
select extract(month from order_date) as Month, 
       count(order_id) as most_frequent_order ,product_id,
       rank() over(partition by extract(month from order_date) order by month )
from orders;


-- Product Revenue by Month:
# 8) Show monthly revenue per product.
select extract(month from order_date) as Month,
       product_id,
       sum(order_amount) as Revenue
from orders
group by extract(month from order_date), product_id
order by month, product_id desc;


-- Top 3 Revenue Months:
# 9) Retrieve the top 3 months by total revenue.
select extract(month from order_date) as month,
	   sum(order_amount) as Total_Revenue
from orders
group by month
order by Total_Revenue desc
limit 3;


-- Monthly Average Order Amount:
# 10) Find the average order value per month.
select extract(month from order_date) as month,
       avg(order_amount) as avg_order_value
from orders
group by month
order by month;       


-- # 2. Revenue generated in January 2023.
SELECT SUM(order_amount) AS jan_revenue
FROM orders
WHERE EXTRACT(MONTH FROM order_date) = 1
  AND EXTRACT(YEAR FROM order_date) = 2023;





