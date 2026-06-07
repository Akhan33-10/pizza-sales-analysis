SELECT * FROM Pizzas;
SELECT * FROM orders;
SELECT * FROM pizza_types;
SELECT * FROM order_details;
SELECT  EXTRACT (MONTH from date) as day FROM orders GROUP BY EXTRACT (MONTH from date) ORDER BY day;
SELECT SUM(price) FROM pizzas;
SELECT SUM(od.quantity * p.price ) as sales FROM pizzas p JOIN order_details od USING(pizza_id);
SELECT COUNT(od.pizza_id) as total_sold , EXTRACT(MONTH FROM o.date) as month FROM order_details od JOIN orders O
USING(order_id) GROUP BY EXTRACT(MONTH FROM o.date) ORDER BY month;

SELECT COUNT(od.pizza_id) as total_sold , EXTRACT(HOUR FROM o.time) as time FROM order_details od JOIN orders O
USING(order_id) GROUP BY EXTRACT(HOUR FROM o.time) ORDER BY time;

SELECT SUM(od.quantity*p.price) as revenue , pt.category FROM order_details od JOIN pizzas p USING(pizza_id)
JOIN pizza_types pt USING(pizza_type_id)GROUP BY pt.category ORDER BY revenue DESC;

SELECT SUM(od.quantity) as total_sold , pt.category FROM order_details od JOIN pizzas p USING(pizza_id)
JOIN pizza_types pt USING(pizza_type_id)GROUP BY pt.category ORDER BY total_sold DESC;

SELECT p.size , COUNT(od.pizza_id) as total_sold FROM pizzas p JOIN order_details od USING(pizza_id)
GROUP BY p.size ORDER BY total_sold DESC;

WITH A as (SELECT o.date , COUNT(od.order_id) as daily_order FROM orders o JOIN order_details od 
USING(order_id) GROUP BY o.date)
SELECT ROUND(AVG(daily_order),2) FROM a;

WITH A as (SELECT o.date , SUM(od.quantity * p.price) as value FROM orders o JOIN order_details od 
USING(order_id) JOIN pizzas p USING(pizza_id) GROUP BY o.date)
SELECT ROUND(PERCENTILE_CONT (0.50) WITHIN GROUP (ORDER BY value )) FROM a;

WITH A AS (SELECT EXTRACT(MONTH FROM O.date) "MONTH" ,SUM(od.quantity *p.price) revenue FROM orders o 
JOIN order_details od
USING(order_id) JOIN pizzas p USING(pizza_id) GROUP BY EXTRACT(MONTH FROM O.date)) 
SELECT *,ROUND(((revenue - prev_month)/NULLIF(prev_month,0)*100),2) AS MOM FROM 
(SELECT *,LAG(revenue,1) OVER(ORDER BY "MONTH") as prev_month FROM a)B ;




