//Analysis 
CREATE TABLE sales (
    region VARCHAR(20),
    product VARCHAR(20),
    month VARCHAR(10),
    amount INT
);

INSERT INTO sales VALUES
('North', 'Mobile', 'Jan', 20000),
('North', 'Mobile', 'Feb', 25000),
('North', 'Laptop', 'Jan', 30000),
('South', 'Mobile', 'Jan', 18000),
('South', 'Laptop', 'Feb', 32000),
('South', 'Laptop', 'Mar', 35000);


SELECT region, product, SUM(amount) AS total_sales
FROM sales
GROUP BY region, product WITH ROLLUP;

SELECT region, product, SUM(amount) AS total_sales
FROM sales
GROUP BY CUBE(region, product);


SELECT  region , product, amount FIRST_VALUE(amount) 
OVER(PARTITION BY region ORDER BY amount)as firstSAle
from sales; 

SELECT region, month, amount,
LEAD(amount) OVER (
    PARTITION BY region
    ORDER BY month
) AS next_month_sale
FROM sales;

SELECT region, month, amount,
LAG(amount) OVER (
    PARTITION BY region
    ORDER BY month
) AS prev_month_sale
FROM sales;

SELECT region, amount,
RANK() OVER (
    PARTITION BY region
    ORDER BY amount DESC
) AS rank_sales
FROM sales;

SELECT region, amount,
DENSE_RANK() OVER (
    PARTITION BY region
    ORDER BY amount DESC
) AS dense_rank_sales
FROM sales;



//denserannk 
SELECT
 title,
 rental_duration,
 DENSE_RANK() OVER (
 ORDER BY rental_duration DESC
 ) AS rental_rank
FROM film;

//firstpayment
select customer_id , payment_date ,amount , first_value(amount)
over (partition by customer_id order by payment_date ) as first_payment
from payment ;

//rollup 
select * from sales_by_store;
select store, sum(total_sales) as total_collection from sales_by_store group by store with
rollup;
select * from actor_info;
select actor_id, first_name, last_name
from film_info
union
select category_id ,name
from category

//rollup
select staff_id , sum(amount) as Total_Amount
from payment
group by staff_id with rollup

select release_year , count(film_id) , sum(rental_rate) as total_collection
from film
group by release_year with rollup;


