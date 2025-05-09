/**
Full join is nothing but fetching all the matching non matching data from the 
right side table and left side table, including null values.

IMPORTANT: MySQL is the only RDBMS which achieves the full join with the help of the union other RDBMSs like 
oracle, postgres support full join
*/



-- right full join query to fetch all the records
select * from characters c
left join apartments_full a 
on c.character_id=a.current_tenant_id
union
select * from characters c
right join apartments_full a 
on c.character_id=a.current_tenant_id;


-- Finding only characters without apartments
select c.character_id, concat(c.first_name,' ',c.last_name) as full_name, a.apartment_number, a.building_address, c.occupation, a.monthly_rent
from characters c 
left join
apartments_full a 
on
a.current_tenant_id=c.character_id
and a.apartment_number is null;

-- Find only apartments without tenants
select a.apartment_number, a.building_address, c.occupation, a.monthly_rent, c.character_id 
from apartments_full a
left join 
characters c
on c.character_id=a.current_tenant_id
and c.character_id is null;

-- Using the FULL JOIN result to find both unmatched cases

select c.character_id, concat(c.first_name,' ',c.last_name) as full_name, c.occupation,
a.apartment_number, a.building_address, a.monthly_rent from 
apartments_full a
left join 
characters c 
on c.character_id=a.current_tenant_id
and a.current_tenant_id is null 
union 
select c.character_id, concat(c.first_name,' ',c.last_name) as full_name, c.occupation,
a.apartment_number, a.building_address, a.monthly_rent from 
apartments_full a
right join 
characters c
on c.character_id=a.current_tenant_id
and a.current_tenant_id is null;

select * from characters;
select * from apartments_full;