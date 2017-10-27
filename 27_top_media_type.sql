-- 27. `top_media_type.sql`: Provide a query that shows the most purchased Media Type.
select Name, max(num_of_sales)
from
(select m.Name, count(t.MediaTypeId) as 'num_of_sales'
from MediaType m join Track t join InvoiceLine l
where m.MediaTypeId = t.MediaTypeId and t.TrackId = l.TrackId
group by m.Name);
