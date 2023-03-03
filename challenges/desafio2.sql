SELECT COUNT(m.music) as cancoes, COUNT(DISTINCT a.album) as albuns, COUNT(DISTINCT art.artist) as artistas FROM SpotifyClone.music as m
INNER JOIN SpotifyClone.album as a
ON m.id_album = a.id_album
INNER JOIN SpotifyClone.artist as art
ON a.id_artist = art.id_artist;
