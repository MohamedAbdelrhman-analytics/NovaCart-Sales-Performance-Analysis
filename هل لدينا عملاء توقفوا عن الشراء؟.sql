select 
max(Orders.OrderDate) as lastdate,
Customers$.CustomerName,
sum(orders.revenue) as total_revenue,
DATEDIFF(day,max(Orders.OrderDate),GETDATE()) as e,
case 
when DATEDIFF(day,max(Orders.OrderDate),GETDATE()) >90then 'inactive'
else 'active'
end as q
from Orders
join Customers$
on Orders.CustomerID = Customers$.CustomerID
group by Customers$.CustomerName

