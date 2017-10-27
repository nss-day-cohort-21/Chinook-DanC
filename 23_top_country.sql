-- 23. `top_country.sql`: Which country's customers spent the most?
select BillingCountry, max(SalesTotal)
from
(select distinct BillingCountry, round(sum(Total), 2) as 'SalesTotal'
from Invoice
group by BillingCountry);
