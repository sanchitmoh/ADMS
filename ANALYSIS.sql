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



