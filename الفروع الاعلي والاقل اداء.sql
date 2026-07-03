 with t as (select Branches$.BranchName,
sum(revenue) as total_revenue,
sum(revenue - cost) as total_profit,
sum(revenue - cost)*100.0/sum(revenue) as profit_margin
from Orders
join Branches$
on Orders.BranchID=Branches$.BranchID
group by Branches$.BranchName),
ranking as (select * ,
rank()over(order by total_profit desc) as high_level,
rank()over(order by total_profit asc) as low_level
from t) 
select * 
from ranking
where high_level = 1 or low_level=1
