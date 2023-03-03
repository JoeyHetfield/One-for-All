SELECT art.artist as artista, al.album
FROM SpotifyClone.artist as art
INNER JOIN SpotifyClone.album as al
ON art.id_artist = al.id_artist
WHERE art.id_artist = 3;