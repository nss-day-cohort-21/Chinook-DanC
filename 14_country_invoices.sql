-- 14. `country_invoices.sql`: Provide a query that shows the # of invoices per country. HINT: [GROUP BY](http://www.sqlite.org/lang_select.html#resultset)
select distinct BillingCountry, count(BillingCountry) as '# of Invoices' from Invoice group by BillingCountry;
