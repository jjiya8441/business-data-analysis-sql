
show columns
from india;

alter table india 
change column `Revenue(billions US$)` `revenue` decimal(15,2);

alter table india 
change column `Profit(billions US$)` `profit` decimal(15,2);

alter table india 
change column `Assets(billions US$)` `assets` decimal(15,2);

alter table india 
change column `Value(billions US$)` `value` decimal(15,2);

alter table india 
change column `Name` `company_name` Varchar(255);

alter table india 
change column `Forbes 2000 rank` `Forbes_2000_rank` int(100);

-- Can you show me the top 10 companies by revenue / profit / value?--
select company_name,revenue
from india
order by revenue
limit 10;

select company_name,profit
from india
order by profit
limit 10;


select company_name, value
from india
order by value
limit 10;


-- Which industries earn the highest revenue?--
select  industry, sum(revenue) as total_revenue
from india 
group by industry 
order by total_revenue desc;

-- Which cities/countries have the most high-value companies?--
select Headquarters, count(*) as total
from india
group by Headquarters
order by total desc;

-- Which companies have the highest profit margins? --
select company_name, CONCAT(ROUND((profit / revenue) * 100, 2), '%') as profit_margin
from india
order by (profit / revenue) * 100 desc;

-- “Which companies have the largest asset base?”
select company_name, assets
from india
order by assets desc;

-- Do higher revenue companies also have higher market value?--
select company_name,revenue,value
from india
order by revenue desc ;

-- Who is the top company in each industry?--
select *
from (
select company_name,Industry,Headquarters,revenue,
	row_number() over ( partition by industry order by revenue desc) as top_company
    from india
)x
where  top_company = 1;

    
    


select company_name, Forbes_2000_rank,industry, profit
from india
where  Headquarters ='Mumbai'
order by profit desc;


select company_name, Forbes_2000_rank,industry,assets 
from india
where  Industry ='Infotech'
order by Forbes_2000_rank desc;



