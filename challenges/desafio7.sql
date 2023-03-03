SELECT 
    art.artist AS artista, al.album AS album, COUNT(f.id_artist) as pessoas_seguidoras
FROM
    SpotifyClone.artist AS art
        INNER JOIN
    SpotifyClone.album AS al ON art.id_artist = al.id_artist
        INNER JOIN
    SpotifyClone.follow AS f ON art.id_artist = f.id_artist
    GROUP BY artista, album
    ORDER BY pessoas_seguidoras DESC, artista, album;
