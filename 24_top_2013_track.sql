-- 24. `top_2013_track.sql`: Provide a query that shows the most purchased track of 2013.

select Name, num_of_downloads
from
(select t.Name, count(t.Name) as 'num_of_downloads'
from Track t join Invoice i join InvoiceLine l
where i.InvoiceDate like '2013%' and i.InvoiceId = l.InvoiceId and l.TrackId = t.TrackId
group by t.Name
order by count(t.Name) desc)
where num_of_downloads = (select max(num_of_downloads) from (select t.Name, count(t.Name) as 'num_of_downloads'
from Track t join Invoice i join InvoiceLine l
where i.InvoiceDate like '2013%' and i.InvoiceId = l.InvoiceId and l.TrackId = t.TrackId
group by t.Name
order by count(t.Name) desc) );
