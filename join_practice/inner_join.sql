/**
 INNER JOIN Things to Note

        1. INNER join excludes the NULL value rows in the join columns
    2. If you want to include them, must use LEFT JOIN or RIGHT JOIN
    3. Joins are slower and time consuming, better we use indexing, choose only relevant columns only
*/


-- Normal INNER JOIN query
select a.author_id, concat(a.first_name,' ',a.last_name) as author_name, a.birth_year, b.title, b.publication_year, b.price from
authors a
inner join
books b
where a.author_id=b.author_id
order by a.author_id;


-- how many books each author has written

select a.author_id, concat(a.first_name, ' ', a.last_name)  as name, count(b.title) as no_of_books_written
from authors a inner join books b on a.author_id=b.author_id
group by b.author_id;  -- you nust use group by clause where the aggregation is possible


-- Get books with their authors and categories

select a.author_id,  concat(a.first_name, ' ', a.last_name)  as author_name,  b.title, GROUP_CONCAT(c.category_name separator ' | ')
from authors a join books b on a.author_id=b.author_id
join book_categories bk on bk.book_id=b.book_id
join categories c on c.category_id=bk.category_id
group by b.book_id;

-- return books published before 1950 by authors born before 1900

select b.book_id, b.title, b.publication_year from authors a
inner join books b on a.author_id=b.author_id
and a.birth_year<1900    -- try to use and in joins as it's faster and efficient as it does the filtering during data fetch so no unnecessary data is fetched
and b.publication_year<1950;


-- return the books published more than 70 years ago

select b.book_id, b.title, b.publication_year from
books b
inner join authors a on b.author_id=a.author_id
where year(curdate())-b.publication_year>70;  -- use where clause when you need to fetch the data once it is fetched

show tables;
select publication_year from books;

