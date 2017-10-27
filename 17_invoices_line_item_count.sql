-- 17. `invoices_line_item_count.sql`: Provide a query that shows all Invoices but includes the # of invoice line items.
select i.*, count(l.InvoiceId) as  '# of line items' from Invoice i join InvoiceLine l where i.InvoiceId = l.InvoiceId group by i.InvoiceId;
