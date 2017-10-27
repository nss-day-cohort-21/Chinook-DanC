-- 19. `top_2009_agent.sql`: Which sales agent made the most in sales in 2009?

select e.FirstName, e.LastName, (round(sum(i.Total), 2)) as '2009 Total' from Employee e join Customer c join Invoice i where e.Title = 'Sales Support Agent' and c.CustomerId = i.CustomerId and c.SupportRepId = e.EmployeeId and i.InvoiceDate like '2009%' group by e.FirstName Order by (round(sum(i.Total), 2)) desc limit 1;

select FirstName, LastName, max(SalesTotal)
from
(select e.FirstName, e.LastName, (round(sum(i.Total), 2)) as 'SalesTotal'
from Employee e join Customer c join Invoice i
where e.Title = 'Sales Support Agent' and c.CustomerId = i.CustomerId and c.SupportRepId = e.EmployeeId and i.InvoiceDate like '2009%'
group by e.FirstName);
