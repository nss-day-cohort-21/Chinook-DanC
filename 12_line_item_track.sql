-- 12. `line_item_track.sql`: Provide a query that includes the purchased track name with each invoice line item.
select t.Name as 'Song Title' from InvoiceLine l join Track t where l.TrackId= t.TrackId group by l.InvoiceLineId;
