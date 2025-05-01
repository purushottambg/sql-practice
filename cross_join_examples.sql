/**
Cross join makes pairs with every possible row from other tables

as it created a matches it's like making pairs and result in multiple rows. 
Cross join internally applies the query performance and put the filters wherever needed.
*/

select * from products p 
cross join colors c 
cross join sizes s;


-- explain is used to get only meaningful results

