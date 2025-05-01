/**
Cross join makes pairs with every possible row from other tables

as it created a matches it's like making pairs and result in multiple rows. 
Cross join internally applies the query performance and put the filters wherever needed.
*/

select * from products p 
cross join colors c 
cross join sizes s;

-- retieve meaningful data
select p.product_id, p.product_name, c.color_name, s.size_name
from products p 
cross join colors c 
cross join sizes s 
where s.size_name in ('M', 'X', 'L');

-- explain is used to get only meaningful results
explain select p.product_id, p.product_name, c.color_name, s.size_name
from products p 
cross join colors c 
cross join sizes s;

select * from products;
select * from sizes;
select * from colors;
