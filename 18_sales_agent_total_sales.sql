-- 18. `sales_agent_total_sales.sql`: Provide a query that shows total sales made by each sales agent.
select e.FirstName, e.LastName, round(sum(i.Total), 2) from Employee e join Customer c join Invoice i where e.Title = 'Sales Support Agent' and c.CustomerId = i.CustomerId and c.SupportRepId = e.EmployeeId group by e.FirstName;
