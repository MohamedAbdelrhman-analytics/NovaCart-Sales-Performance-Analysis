with a as (select Products$.ProductName,sum(orders.revenue) as r
from orders 
join Products$
on Orders.ProductID = Products$.ProductID
group by Products$.ProductName, Products$.ProductID ) ,
ranking as (select *,
rank() over(order by r desc) as k
from a)
select *
from ranking
where k =1
