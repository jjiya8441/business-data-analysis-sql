select * from philippines;

UPDATE philippines
SET `Revenue(USD millions)` = REPLACE(`Revenue(USD millions)`, ',', '');

Alter table philippines
 change column `Revenue(USD millions)` `revenue` int; 
 
 Alter table philippines
 change column `Name` `company_name` varchar(200); 
 
 UPDATE philippines
SET `Profits(USD millions)` = REPLACE(`Profits(USD millions)`, ',', '');

UPDATE philippines
SET `Profits(USD millions)`= REPLACE(REPLACE(`Profits(USD millions)`, '(', ''), ')', '');


Alter table philippines
 change column `Profits(USD millions)` `profit` int; 
 
 
 -- Top 10 company which has most profit -- 
 select company_name, industry,profit
 from philippines
order by profit desc
limit 10;


-- Average Revenue filtered by industry--
select industry, Round(avg (revenue),2) as avg_revenue
from philippines
group by industry ;

-- Which industry has the highest number of companies?--
select Industry , Count(Company_name) as total
from philippines
group by industry;

-- Calculate profit margin for each company--
select company_name,industry, profit/revenue *100 as profit_margin
from philippines
order by profit_margin desc;

-- List companies headquartered in Pasig, ordered by revenue-- 
select company_name,Headquarters, revenue 
from philippines
where Headquarters ='Pasig'
order by revenue desc;

-- Find industry-wise total revenue--
select industry, sum(revenue) as total_revenue ,Avg(profit) as avg_profit
from philippines
group by Industry
order by total_revenue desc ;
 
 -- Find the company with highest profit in each industry--
 select company_name,industry,profit
 from (
 select company_name,industry,profit,
 row_number() over ( partition by industry order by profit desc) as rn 
 from philippines
 ) t
 where rn= 1;
 