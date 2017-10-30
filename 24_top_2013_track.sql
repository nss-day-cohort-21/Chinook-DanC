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
