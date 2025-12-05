select * 
from united_states;


update united_states
set `Revenue (USD millions)` = replace(`Revenue (USD millions)`,',','');

update united_states
set `Employees` = replace(`Employees`,',','');

alter table united_states
change column `Name` `company_name` varchar(200);

alter table united_states
change column `Revenue (USD millions)` `revenue` int;

alter table united_states
change column `Revenue growth` `revenue_growth` DECIMAL(5,2);

ALTER TABLE united_states
ADD COLUMN city VARCHAR(100),
ADD COLUMN state VARCHAR(100);

UPDATE united_states
SET 
    city = SUBSTRING_INDEX(headquarters, ',', 1),
   state = TRIM(SUBSTRING_INDEX(headquarters, ',', -1));
   
alter table united_states
drop column Headquarters;

-- Find the top 5 companies with the highest revenue--
select company_name,state,revenue_growth
from united_states
order by revenue_growth desc
limit 5;

-- Find the average revenue for each industry--
select industry, round(avg(revenue),2) as avg_revenue 
from united_states
group by industry 
order by avg_revenue desc
limit 10;

-- Find the company with the highest revenue growth in each industry--
select industry,company_name,revenue_growth
from united_states
where (industry,revenue_growth) in (
select industry , max(revenue_growth) 
from united_states
group by industry
);


-- List companies whose revenue is above their industry average--
select c.industry,c.company_name,c.revenue 
from united_states c
where c.revenue >
(
select avg(revenue)
from united_states
where Industry=c.industry
);

-- Count how many companies exist in each state--
SELECT state, COUNT(*) AS total_companies
FROM united_states
GROUP BY state
ORDER BY total_companies DESC;

-- Find the top 3 most populated cities by number of employees--
select city,sum(employees) as total_employee
from united_states
group by city 
order by total_employee desc
limit 3;

-- Find companies with a revenue growth above 10%--
select company_name, revenue_growth 
from united_states
where revenue_growth >10;




