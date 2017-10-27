-- 20. `top_agent.sql`: Which sales agent made the most in sales over all?

select e.FirstName, e.LastName, round(sum(i.Total), 2) from Employee e join Customer c join Invoice i where e.Title = 'Sales Support Agent' and c.CustomerId = i.CustomerId and c.SupportRepId = e.EmployeeId group by e.FirstName Order by round(sum(i.Total), 2) desc limit 1;

select FirstName, LastName, max(SalesTotal)
from
(select e.FirstName, e.LastName, round(sum(i.Total), 2) as 'SalesTotal'
from Employee e join Customer c join Invoice i
where e.Title = 'Sales Support Agent' and c.CustomerId = i.CustomerId and c.SupportRepId = e.EmployeeId
group by e.FirstName);
