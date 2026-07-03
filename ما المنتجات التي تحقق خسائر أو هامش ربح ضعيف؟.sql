with a as (select Products$.ProductName,
sum(orders.revenue) as total_revenue,
sum(orders.revenue - orders.cost) as total_profit,
sum(orders.revenue-Orders.Cost)*100.0/sum(orders.revenue) as profit_margin
from orders 
join Products$
on Orders.ProductID = Products$.ProductID
group by Products$.ProductName )
select *
from a 
where profit_margin < 20 or
total_profit <0
or total_revenue <0
order by profit_margin asc
