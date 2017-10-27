-- 15. `playlists_track_count.sql`: Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resulant table.
select p.Name, count(t.PlaylistId) from Playlist p join PlaylistTrack t where t.PlaylistId = p.PlaylistId group by p.Name;
