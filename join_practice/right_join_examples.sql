/**
Right Join Queries
*/

-- DEMO: LEFT JOIN to see all apartments and their residents (if any)
SELECT a.apartment_number, a.floor_number, a.wing_name, 
       r.first_name, r.last_name
FROM apartments a
LEFT JOIN residents r
ON r.apartment_id = a.apartment_id
order by a.apartment_number;

-- DEMO: RIGHT JOIN to see all apartments and their residents (if any)
SELECT a.apartment_number, a.floor_number, a.wing_name, 
       r.first_name, r.last_name
FROM residents r 
RIGHT JOIN apartments a
ON r.apartment_id = a.apartment_id
order by a.apartment_number;

-- Find all the unoccupied apartments
select 
a.apartment_id, a.apartment_number, ifnull(concat(r.first_name, ' ', r.last_name), 'un-occupied') as resident_name, ifnull(r.occupation, 'un-occupied') as occupation
FROM residents r
right join
apartments a
on a.apartment_id=r.apartment_id
and r.apartment_id is null;

-- Count the number of resedents per apartment
SELECT
a.apartment_id, a.apartment_number, count(r.resident_id) as count_of_residents
FROM apartments a
RIGHT JOIN
residents r
ON
a.apartment_id=r.apartment_id
group by r.apartment_id;


-- List all apartments with their residents and maintenance request status

select
a.apartment_id, a.apartment_number, r.resident_id, concat(r.first_name, ' ', r.last_name) as name,
rq.status
from
maintenance_requests rq
RIGHT JOIN 
residents r on r.apartment_id=rq.apartment_id
right join 
apartments a on a.apartment_id=r.apartment_id
group by a.apartment_id, r.resident_id, rq.request_id;

-- write a query to find the floor with the most unoccupied apartments
select a.apartment_id, a.apartment_number, a.floor_number, count(r.resident_id) as resident_families
from  residents r 
RIGHT JOIN 
apartments a 
ON 
a.apartment_id=r.apartment_id
group by a.apartment_id
order by resident_families desc
LIMIT 4;

-- write a query to list all apartments along with the total number of maintenance request

select
a.apartment_id, a.apartment_number, count(mr.request_id) as total_requests
from
maintenance_requests mr
RIGHT JOIN 
apartments a
ON 
a.apartment_id=mr.apartment_id
group by a.apartment_id;


select * from apartments;
select * from residents;
select * from maintenance_requests;
show tables;