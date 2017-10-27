-- 26. `top_3_artists.sql`: Provide a query that shows the top 3 best selling artists.

select Name, Sales
from
(select a.Name, sum(l.Quantity) as 'Sales'
from Artist a join Album b join Track t join InvoiceLine l
where a.ArtistId = b.ArtistId and b.AlbumId = t.AlbumId and t.TrackId = l.TrackId
group by a.Name)
order by Sales desc limit 3;
