with h as (select Sellers$.SellerName,
count(distinct Orders.OrderID) as total_orders,
SUM(orders.revenue) as total_revenue,
sum(orders.revenue - orders.cost) as total_profit
from Orders
join Sellers$
on Orders.SellerID=Sellers$.SellerID
group by Sellers$.SellerName,Sellers$.SellerID),
ranking as (select *,
rank()over(order by total_orders desc ,total_revenue desc ,total_profit desc ) as r,
rank()over(order by total_orders asc ,total_revenue asc ,total_profit asc ) as e
from h)
select * 
from ranking 
where r =1
or e =1