CREATE DATABASE Spotify

USE Spotify

CREATE TABLE Albums(
	Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(100),
	Tract INT,
	[Year] INT ,
	Duraction INT,
	

)
CREATE TABLE Musics(
	Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(100),
	TotalSecond INT,
	ListenerCount INT,
	AlbumId INT CONSTRAINT FK_AlbumId FOREIGN KEY REFERENCES Albums(Id)
	

	)



CREATE TABLE Artists(
	Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(100)
	
	
)






CREATE TABLE MusicArtist(
	Id INT PRIMARY KEY IDENTITY,
	MusicId INT CONSTRAINT FK_MusicAlbumId FOREIGN KEY REFERENCES Musics(Id),
	ArtistId INT CONSTRAINT FK_MusicArtistId FOREIGN KEY REFERENCES Artists(Id)
)

CREATE VIEW V_GetFullMusicDetail
AS 
SELECT 

M.Name 'Music',
M.TotalSecond 'TotalSecond',
A.Name 'Artist',
Al.Name 'Album'


FROM Musics AS M 
JOIN Artists AS A
ON M.Id=A.Id
JOIN Albums AS Al
ON A.Id=Al.Id

SELECT * FROM V_GetFullMusicDetail



CREATE  VIEW V_GETFULLALBUMS
AS
SELECT
A.Name 'AlbumName', COUNT(M.Id) 'MusicCount'
FROM Albums A
JOIN Musics AS M
ON M.AlbumId = A.Id
GROUP BY A.Name

SELECT * FROM V_GETFULLALBUMS

CREATE PROCEDURE SelectAllAlbums @ListenerCount nvarchar(50)
AS
SELECT * FROM Albums WHERE listenerCount = @ListenerCount
GO;

