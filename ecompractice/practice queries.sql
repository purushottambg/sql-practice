-- find out the most selling products
select p.product_id, p.name, count(*) sold_items from products p
join order_items o on p.product_id=o.product_id
group by p.product_id
order by sold_items desc limit 1;

-- 5 customers who spent the most
select u.user_id, u.full_name, sum(p.price) as total_spent
from users u 
join orders o on o.user_id=u.user_id
join order_items oi on oi.order_id=o.order_id
join products p on p.product_id=oi.product_id
group by u.user_id order by total_spent desc
limit 5;