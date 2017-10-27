-- 22. `sales_per_country.sql`: Provide a query that shows the total sales per country.
select distinct BillingCountry, round(sum(Total), 2) as 'SalesTotal'
from Invoice
group by BillingCountry;
