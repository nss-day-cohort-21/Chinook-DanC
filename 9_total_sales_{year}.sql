-- 9. `total_sales_{year}.sql`: What are the respective total sales for each of those years?
select sum(case when InvoiceDate like '2009%' then Total else 0 end) as '2009 sales', sum(case when InvoiceDate like '2011%' then Total else 0 end) as '2011 sales' from Invoice;
