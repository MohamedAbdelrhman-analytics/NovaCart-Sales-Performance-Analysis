with a as (select Category$.CategoryName,Products$.ProductID
from Products$
join Category$
on Products$.CategoryID=Category$.CategoryID
group by Category$.CategoryName,Products$.ProductID),
w as (select a.CategoryName ,
sum(orders.revenue) as total_revenue,
sum(orders.revenue - orders.cost) as total_profit
from Orders
join a
on Orders.ProductID = a.ProductID
group by CategoryName 
),
ranking as (select *,
rank()over(order by total_revenue desc ) as r,
rank()over(order by total_profit desc ) as  p
from w)
select *
from ranking
where r =1 or p =1