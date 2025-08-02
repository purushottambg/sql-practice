/**
LEFT Join is equivalent to LEFT OUTER JOIN the only difference is in their names

-- It returns all the records from the left table and only the matching records from the right table.
-- If no match exist in the right table, NUll values will be returned

*/


-- Normal query to check the returning results

select * from 
customers c
LEFT JOIN orders o
ON c.customer_id=o.customer_id;


-- Query the orders and total amount paid by the customers

select c.customer_id, c.customer_name, c.city, ifnull(sum(o.total_amount), 0) as total_spend
from customers c
LEFT JOIN
orders o on c.customer_id=o.customer_id 
group by c.customer_id;


-- Query the customers to check the people who are from the Newyork city

select c.customer_id, c.customer_name, c.city, o.order_id, o.total_amount
from (select * from customers where city like '%ew%') c 
LEFT JOIN
orders o 
on c.customer_id=o.customer_id;


-- Query the customer who haven't placed order in last 30 days and have never placed an order or placed more than 30 days ago

SELECT
c.customer_id, c.customer_name, c.city, ifnull(o.order_id, 'Never placed an order') as order_id, ifnull(o.total_amount, 0) as total_spent
FROM
customers c 
LEFT JOIN 
orders o
ON 
c.customer_id=o.customer_id
AND
(date(curdate())-date(o.order_date))>30;

select day(o.order_date)-day(curdate()), date(o.order_date), date(curdate()),  (date(curdate())-date(o.order_date)) from orders o;

show tables;
show create table shipping;
select * from  orders;