-- 11. `line_items_per_invoice.sql`: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: [GROUP BY](http://www.sqlite.org/lang_select.html#resultset)
select count(*) as '# of litems' from Invoice i join InvoiceLine l where i.InvoiceId = l.InvoiceId group by i.InvoiceId;
