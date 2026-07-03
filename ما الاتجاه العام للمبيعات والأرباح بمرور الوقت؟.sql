select year(orderdate) as year_order,
month(orderdate) as month_order,
sum(revenue) as total_revenue,
sum(revenue - cost) as total_profit
from Orders
group by year(orderdate),
month(orderdate)
order by year_order asc,
month_order asc