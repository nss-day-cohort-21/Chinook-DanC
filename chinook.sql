-- For each of the following exercises, provide the appropriate query. Yes, even the ones that are expressed in the form of questions. Everything from class and the [Sqlite Documentation](http://www.sqlite.org/) is fair game.

-- 1. `non_usa_customers.sql`: Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
select FirstName, LastName, Country from Customer where Country <> 'USA';
-- 2. `brazil_customers.sql`: Provide a query only showing the Customers from Brazil.
select FirstName, LastName, Country from Customer where Country = 'Brazil';
-- 3. `brazil_customers_invoices.sql`: Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
select c.FirstName, c.LastName, i.InvoiceId, i.InvoiceDate, i.BillingCountry from Customer c join Invoice i where c.Country = i.BillingCountry and c.Country = 'Brazil';
-- 4. `sales_agents.sql`: Provide a query showing only the Employees who are Sales Agents.
select FirstName, LastName, Title from Employee where Title = 'Sales Support Agent';
-- 5. `unique_invoice_countries.sql`: Provide a query showing a unique/distinct list of billing countries from the Invoice table.
select distinct BillingCountry from Invoice;
-- 6. `sales_agent_invoices.sql`: Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
select i.InvoiceId, e.FirstName || " " || e.LastName as 'fullname'
from Invoice i join Customer c join Employee e
where i.CustomerId = c.CustomerId and c.SupportRepId = e.EmployeeId;
-- 7. `invoice_totals.sql`: Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
select i.InvoiceId , i.Total, c.FirstName 'Customer First', c.LastName 'Customer Last', e.FirstName 'Employee First', e.LastName 'Employee Last' from Invoice i join Customer c, Employee e where i.CustomerId = c.CustomerId and c.SupportRepId = e.EmployeeId;
-- 8. `total_invoices_{year}.sql`: How many Invoices were there in 2009 and 2011?
select sum(case when InvoiceDate like '2009%' then 1 else 0 end) as '2009', sum(case when InvoiceDate like '2011%' then 1 else 0 end) as '2011' from Invoice;
-- 9. `total_sales_{year}.sql`: What are the respective total sales for each of those years?
select sum(case when InvoiceDate like '2009%' then Total else 0 end) as '2009 sales', sum(case when InvoiceDate like '2011%' then Total else 0 end) as '2011 sales' from Invoice;
-- 10. `invoice_37_line_item_count.sql`: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
select count(InvoiceLineId) as LineItems from InvoiceLine where InvoiceId = 37;
-- 11. `line_items_per_invoice.sql`: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: [GROUP BY](http://www.sqlite.org/lang_select.html#resultset)
select count(*) as '# of litems'
from InvoiceLine
group by InvoiceId;
-- 12. `line_item_track.sql`: Provide a query that includes the purchased track name with each invoice line item.
select t.Name as 'Song Title' from InvoiceLine l join Track t where l.TrackId= t.TrackId group by l.InvoiceLineId;
-- 13. `line_item_track_artist.sql`: Provide a query that includes the purchased track name AND artist name with each invoice line item.
select t.Name as 'Song Title', r.Name as 'Artist Name' from InvoiceLine l join Track t join Album a join Artist r where l.TrackId= t.TrackId and t.AlbumId = a.AlbumId and a.ArtistId = r.ArtistId group by l.InvoiceLineId;
-- 14. `country_invoices.sql`: Provide a query that shows the # of invoices per country. HINT: [GROUP BY](http://www.sqlite.org/lang_select.html#resultset)
select distinct BillingCountry, count(BillingCountry) as '# of Invoices' from Invoice group by BillingCountry;
-- 15. `playlists_track_count.sql`: Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resulant table.
select p.Name, count(t.PlaylistId) from Playlist p join PlaylistTrack t where t.PlaylistId = p.PlaylistId group by p.Name;
-- 16. `tracks_no_id.sql`: Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.
select t.Name as 'Track Name', a.Title as 'Album Title', m.Name as 'Media Typw', g.Name as 'Genre' from Track t join Album a join MediaType m join Genre g where t.AlbumId = a.AlbumId and t.MediaTypeId = m.MediaTypeId and t.GenreId = g.GenreId group by t.Name;
-- 17. `invoices_line_item_count.sql`: Provide a query that shows all Invoices but includes the # of invoice line items.
select i.*, count(l.InvoiceId) as  '# of line items' from Invoice i join InvoiceLine l where i.InvoiceId = l.InvoiceId group by i.InvoiceId;
-- 18. `sales_agent_total_sales.sql`: Provide a query that shows total sales made by each sales agent.
select e.FirstName, e.LastName, round(sum(i.Total), 2) from Employee e join Customer c join Invoice i where e.Title = 'Sales Support Agent' and c.CustomerId = i.CustomerId and c.SupportRepId = e.EmployeeId group by e.FirstName;

-- 19. `top_2009_agent.sql`: Which sales agent made the most in sales in 2009?

select e.FirstName, e.LastName, (round(sum(i.Total), 2)) as '2009 Total' from Employee e join Customer c join Invoice i where e.Title = 'Sales Support Agent' and c.CustomerId = i.CustomerId and c.SupportRepId = e.EmployeeId and i.InvoiceDate like '2009%' group by e.FirstName Order by (round(sum(i.Total), 2)) desc limit 1;

select FirstName, LastName, max(SalesTotal)
from
(select e.FirstName, e.LastName, (round(sum(i.Total), 2)) as 'SalesTotal'
from Employee e join Customer c join Invoice i
where e.Title = 'Sales Support Agent' and c.CustomerId = i.CustomerId and c.SupportRepId = e.EmployeeId and i.InvoiceDate like '2009%'
group by e.FirstName);

--     > **Hint:** Use the [MAX](https://www.sqlite.org/lang_aggfunc.html#maxggunc) function on a [subquery](http://beginner-sql-tutorial.com/sql-subquery.htm).

-- 20. `top_agent.sql`: Which sales agent made the most in sales over all?

select e.FirstName, e.LastName, round(sum(i.Total), 2) from Employee e join Customer c join Invoice i where e.Title = 'Sales Support Agent' and c.CustomerId = i.CustomerId and c.SupportRepId = e.EmployeeId group by e.FirstName Order by round(sum(i.Total), 2) desc limit 1;

select FirstName, LastName, max(SalesTotal)
from
(select e.FirstName, e.LastName, round(sum(i.Total), 2) as 'SalesTotal'
from Employee e join Customer c join Invoice i
where e.Title = 'Sales Support Agent' and c.CustomerId = i.CustomerId and c.SupportRepId = e.EmployeeId
group by e.FirstName);
-- 21. `sales_agent_customer_count.sql`: Provide a query that shows the count of customers assigned to each sales agent.
select e.FirstName, e.LastName, sum(case when e.EmployeeId = c.SupportRepId then 1 else 0 end) from Employee e join Customer c where e.Title = 'Sales Support Agent' Group by e.FirstName;

-- 22. `sales_per_country.sql`: Provide a query that shows the total sales per country.
select distinct BillingCountry, round(sum(Total), 2) as 'SalesTotal'
from Invoice
group by BillingCountry;

-- 23. `top_country.sql`: Which country's customers spent the most?
select BillingCountry, max(SalesTotal)
from
(select distinct BillingCountry, round(sum(Total), 2) as 'SalesTotal'
from Invoice
group by BillingCountry);

-- 24. `top_2013_track.sql`: Provide a query that shows the most purchased track of 2013.

select trackname, max(tracksales)
from
(select t.name as trackname, sum(il.quantity) as tracksales
from track t
join InvoiceLine il on t.trackId = il.trackId
join Invoice i on il.invoiceid = i.invoiceid
where strftime('%Y', i.invoicedate) = '2013'
group by t.name
order by sum(il.quantity) desc)

-- 25. `top_5_tracks.sql`: Provide a query that shows the top 5 most purchased tracks over all.

select t.Name, count(l.TrackId) as 'num_of_downloads'
from Track t join InvoiceLine l
where t.TrackId = l.TrackId
group by t.Name
order by num_of_downloads desc limit 5;

-- 26. `top_3_artists.sql`: Provide a query that shows the top 3 best selling artists.

select Name, Sales
from
(select a.Name, sum(l.Quantity) as 'Sales'
from Artist a join Album b join Track t join InvoiceLine l
where a.ArtistId = b.ArtistId and b.AlbumId = t.AlbumId and t.TrackId = l.TrackId
group by a.Name)
order by Sales desc limit 3;


-- 27. `top_media_type.sql`: Provide a query that shows the most purchased Media Type.
select Name, max(num_of_sales) as 'Sales'
from
(select m.Name, count(t.MediaTypeId) as 'num_of_sales'
from MediaType m join Track t join InvoiceLine l
where m.MediaTypeId = t.MediaTypeId and t.TrackId = l.TrackId
group by m.Name);



















