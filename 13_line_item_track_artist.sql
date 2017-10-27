-- 13. `line_item_track_artist.sql`: Provide a query that includes the purchased track name AND artist name with each invoice line item.
select t.Name as 'Song Title', r.Name as 'Artist Name' from InvoiceLine l join Track t join Album a join Artist r where l.TrackId= t.TrackId and t.AlbumId = a.AlbumId and a.ArtistId = r.ArtistId group by l.InvoiceLineId;
