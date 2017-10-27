-- 21. `sales_agent_customer_count.sql`: Provide a query that shows the count of customers assigned to each sales agent.
select e.FirstName, e.LastName, sum(case when e.EmployeeId = c.SupportRepId then 1 else 0 end) from Employee e join Customer c where e.Title = 'Sales Support Agent' Group by e.FirstName;
