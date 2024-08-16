--Quantity sold per track
SELECT 
  t1.TrackId, 
  t2.Name, 
  SUM(t1.Quantity) as Quantity_sold 
FROM 
  `chinook-432700.Chinook.InvoiceLine` as t1 
  JOIN `chinook-432700.Chinook.Track` as t2 ON t1.TrackId = t2.TrackId 
GROUP BY 
  t1.TrackId, 
  t2.Name 
Order by 
  Quantity_sold DESC;
_______________ 
--Quantity sold
SELECT 
  SUM(Quantity) as Quantity_sold 
FROM 
  `chinook-432700.Chinook.InvoiceLine` _______________ --Quantity sold using CTE
  WITH TEMPTABLE1 AS(
    SELECT 
      t1.TrackId, 
      SUM(t1.Quantity) as Quantity_sold, 
      t2.Name, 
    FROM 
      `chinook-432700.Chinook.InvoiceLine` as t1 
      JOIN `chinook-432700.Chinook.Track` as t2 ON t1.TrackId = t2.TrackId 
    GROUP BY 
      t2.Name, 
      t1.TrackID
  ) 
select 
  sum(TEMPTABLE1.Quantity_sold) 
from 
  TEMPTABLE1;
_______________ 
--Sum of sales per track
SELECT 
  t1.TrackId, 
  SUM(t1.Quantity * t1.UnitPrice) as Sum_of_sales, 
  t2.Name, 
FROM 
  `chinook-432700.Chinook.InvoiceLine` as t1 
  JOIN `chinook-432700.Chinook.Track` as t2 ON t1.TrackId = t2.TrackId 
GROUP BY 
  t2.Name, 
  t1.TrackID 
Order by 
  Sum_of_sales DESC;
_______________ 
--Sum of sales 
SELECT 
  ROUND(
    SUM(Quantity * UnitPrice), 
    2
  ) as Sum_of_sales 
from 
  `Chinook.InvoiceLine` _______________ --Sum of sales using CTE
  WITH TEMPTABLE2 AS (
    SELECT 
      t1.TrackId, 
      SUM(t1.Quantity * t1.UnitPrice) as Sum_of_sales, 
      t2.Name 
    FROM 
      `chinook-432700.Chinook.InvoiceLine` as t1 
      JOIN `chinook-432700.Chinook.Track` as t2 ON t1.TrackId = t2.TrackId 
    GROUP BY 
      t1.TrackID, 
      t2.Name
  ) 
select 
  Round(
    sum(TEMPTABLE2.Sum_of_sales), 
    0
  ) 
from 
  TEMPTABLE2;
_______________ 
--Quantity sold per album
--Invoice table doesn't have an Album Id,Soto get the album id we need to use the track id belonging to it.
SELECT 
  t2.AlbumId, 
  t3.Title, 
  count(t2.AlbumId) as Album_count 
FROM 
  `chinook-432700.Chinook.InvoiceLine` as t1 
  JOIN `chinook-432700.Chinook.Track` as t2 ON t1.TrackId = t2.TrackId 
  JOIN `chinook-432700.Chinook.Album` as t3 ON t2.AlbumId = t3.AlbumId 
group by 
  t2.AlbumId, 
  t3.Title 
order by 
  album_count DESC;
_______________ 
---Sum of sales per album
SELECT 
  t2.AlbumId, 
  t3.Title, 
  Round(
    SUM(t1.Quantity * t1.UnitPrice), 
    0
  ) as Sum_of_sales 
FROM 
  `chinook-432700.Chinook.InvoiceLine` as t1 
  JOIN `chinook-432700.Chinook.Track` as t2 ON t1.TrackId = t2.TrackId 
  JOIN `chinook-432700.Chinook.Album` as t3 ON t2.AlbumId = t3.AlbumId 
group by 
  t2.AlbumId, 
  t3.Title 
order by 
  Sum_of_sales DESC;
_______________ 
--Sum of sales by artist
---- We will need to join 4 tables From InvoiceLine(TrackId), From Track(TrackId),From Album(Artist Id),From Artist(ArtistName)
SELECT 
  t4.ArtistId, 
  t4.Name, 
  sum(t1.Quantity * t1.UnitPrice) as sum_of_sales 
FROM 
  `chinook-432700.Chinook.InvoiceLine` as t1 
  JOIN `chinook-432700.Chinook.Track` as t2 ON t1.TrackId = t2.TrackId 
  JOIN `chinook-432700.Chinook.Album` as t3 ON t2.AlbumId = t3.AlbumId 
  JOIN `chinook-432700.Chinook.Artist` as t4 ON t3.ArtistId = t4.ArtistId 
group by 
  t4.ArtistId, 
  t4.Name 
order by 
  sum_of_sales DESC;
_______________ 
--Quantity of sales per genre
SELECT 
  SUM(t1.Quantity) as Quantity_sold, 
  t2.GenreId, 
  t3.Name 
FROM 
  `chinook-432700.Chinook.InvoiceLine` as t1 
  JOIN `chinook-432700.Chinook.Track` as t2 ON t1.TrackId = t2.TrackId 
  JOIN `chinook-432700.Chinook.Genre` as t3 ON t2.GenreId = t3.GenreId 
GROUP BY 
  t2.GenreId, 
  t3.Name 
ORDER BY 
  Quantity_sold DESC;
_______________ 
--Sum of sales per genre
SELECT 
  ROUND(
    SUM(t1.Quantity * t1.UnitPrice), 
    2
  ) as Sum_of_sales, 
  t2.GenreId, 
  t3.Name 
FROM 
  `chinook-432700.Chinook.InvoiceLine` as t1 
  JOIN `chinook-432700.Chinook.Track` as t2 ON t1.TrackId = t2.TrackId 
  JOIN `chinook-432700.Chinook.Genre` as t3 ON t2.GenreId = t3.GenreId 
GROUP BY 
  t2.GenreId, 
  t3.Name 
ORDER BY 
  Sum_of_sales DESC;
_______________ 
--Sum of sales by artist and album ranked
WITH SALES_BY_ARTIST AS (
  SELECT 
    t4.ArtistId, 
    t4.Name, 
    sum(t1.Quantity * t1.UnitPrice) as sum_of_sales 
  FROM 
    `chinook-432700.Chinook.InvoiceLine` as t1 
    JOIN `chinook-432700.Chinook.Track` as t2 ON t1.TrackId = t2.TrackId 
    JOIN `chinook-432700.Chinook.Album` as t3 ON t2.AlbumId = t3.AlbumId 
    JOIN `chinook-432700.Chinook.Artist` as t4 ON t3.ArtistId = t4.ArtistId 
  group by 
    t4.ArtistId, 
    t4.Name
), 
ALBUM_SALES AS(
  SELECT 
    t2.AlbumId, 
    t3.Title, 
    t3.ArtistId, 
    SUM(t1.Quantity) as Album_sum 
  FROM 
    `chinook-432700.Chinook.InvoiceLine` as t1 
    JOIN `chinook-432700.Chinook.Track` as t2 ON t1.TrackId = t2.TrackId 
    JOIN `chinook-432700.Chinook.Album` as t3 ON t2.AlbumId = t3.AlbumId 
  group by 
    t2.AlbumId, 
    t3.Title, 
    t3.ArtistId
) 
SELECT 
  t1.Name, 
  t2.Title, 
  t2.Album_sum 
FROM 
  SALES_BY_ARTIST AS t1 
  JOIN ALBUM_SALES AS t2 ON t1.ArtistId = t2.ArtistId 
ORDER BY 
  t2.Album_sum DESC;
_______________
