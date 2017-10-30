-- 6. `sales_agent_invoices.sql`: Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
select i.InvoiceId, e.FirstName || " " || e.LastName as 'fullname'
from Invoice i join Customer c join Employee e
where i.CustomerId = c.CustomerId and c.SupportRepId = e.EmployeeId;
