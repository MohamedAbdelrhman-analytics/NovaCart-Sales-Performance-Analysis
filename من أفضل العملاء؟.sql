with h as (select Customers$.CustomerName,
count(distinct Orders.OrderID) as total_orders,
SUM(orders.revenue) as total_revenue,
sum(orders.revenue - orders.cost) as total_profit
from Orders
join Customers$
on Orders.CustomerID=Customers$.CustomerID
group by Customers$.CustomerName,Customers$.CustomerID),
ranking as (select *,
rank()over(order by total_orders desc ,total_revenue desc ,total_profit desc ) as r
from h)
select * 
from ranking 
where r =1