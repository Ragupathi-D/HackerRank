/*
P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
* 
* * 
* * * 
* * * * 
* * * * *
Write a query to print the pattern P(20).
*/

with RECURSIVE cte as
(select 1 AS i FROM dual union all
 select i+1 i from cte where i < 20)
select repeat('* ', i) from cte
order by i asc
