-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. 
-- Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT s.Title as 'Song Title', al.Title as 'Artist Title', ar.ArtistName
FROM Song as s
LEFT JOIN Album as al on s.AlbumId = al.Id
LEFT JOIN Artist as ar on s.ArtistId = ar.Id
WHERE ar.ArtistName LIKE 'ZZTop';

-- Reminder: Direction of join matters. Try the following statements and see the difference in results.

-- SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.Id;
-- SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.Id;

-- Write a SELECT statement to display how many songs exist for each album. 
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT a.Title, COUNT(s.Title) as 'Number of Songs'
FROM Song as s
LEFT JOIN Album a on s.AlbumId = a.Id
GROUP BY a.Title;

-- Write a SELECT statement to display how many songs exist for each artist. 
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT a.ArtistName, COUNT(s.Title) as 'Number of Songs'
FROM Song as s
LEFT JOIN Artist a on s.ArtistId = a.Id
GROUP BY a.ArtistName;

-- Write a SELECT statement to display how many songs exist for each genre. 
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT g.Label, COUNT(s.Title) as 'Number of Songs'
FROM Song as s
LEFT JOIN Genre g on s.GenreId = g.Id
GROUP BY g.Label;

-- Using MAX() function, write a select statement to find the album with the longest duration. 
-- The result should display the album title and the duration.
SELECT Title, AlbumLength
FROM Album
WHERE AlbumLength = (SELECT MAX(AlbumLength) 
FROM Album);

-- Using MAX() function, write a select statement to find the song with the longest duration. 
-- The result should display the song title and the duration.
SELECT Title, SongLength
FROM Song
WHERE SongLength = (SELECT MAX(SongLength) 
FROM Song);

-- Modify the previous query to also display the title of the album.
SELECT s.Title as SongTitle, a.Title, s.SongLength
FROM Song as s
JOIN Album as a on s.AlbumId = a.Id
WHERE s.SongLength = (SELECT MAX(SongLength) 
FROM Song);