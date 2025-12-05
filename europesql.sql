select * 
from europe;


alter table europe 
change column `Revenue(US$ billions)` `revenue` double ;


alter table europe 
change column `Company` `company_name` varchar(200) ;

alter table europe 
change column `Headquarters` `headquarters` varchar(200) ;

-- Which top 10 industry produce most revenue in Europe?
select  Industry, sum(revenue)
from europe
group by Industry 
limit 10;

-- Top 10 company based on revenue --
select * 
from europe 
limit 10;

-- Ascending orders of the company based on their revenue --
select headquarters,company_name, Industry
from europe 
order by revenue asc;


-- company based in germany based on their revenue in descending order--
select company_name, headquarters
from europe
where headquarters='Germany'
order by revenue desc;


-- Which industry as highest revenue in europe --
select Industry, sum(revenue) as total_revenue 
from europe
group by Industry
order by total_revenue desc;

