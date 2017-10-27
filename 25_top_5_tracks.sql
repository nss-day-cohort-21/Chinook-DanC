-- 25. `top_5_tracks.sql`: Provide a query that shows the top 5 most purchased tracks over all.

select t.Name, count(l.TrackId) as 'num_of_downloads'
from Track t join InvoiceLine l
where t.TrackId = l.TrackId
group by t.Name
order by num_of_downloads desc limit 5;
