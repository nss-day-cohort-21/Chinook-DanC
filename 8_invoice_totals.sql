-- 8. `total_invoices_{year}.sql`: How many Invoices were there in 2009 and 2011?
select sum(case when InvoiceDate like '2009%' then 1 else 0 end) as '2009', sum(case when InvoiceDate like '2011%' then 1 else 0 end) as '2011' from Invoice;
