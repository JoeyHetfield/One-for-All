SELECT art.artist as artista, CASE
	WHEN COUNT(fav.id_music) >= 5 THEN 'A'
    WHEN COUNT(fav.id_music) IN (3, 4) THEN 'B'
    WHEN COUNT(fav.id_music) IN (1, 2) THEN 'C'
    ELSE '-'
    END AS ranking
FROM SpotifyClone.artist as art
INNER JOIN SpotifyClone.album as al
ON art.id_artist = al.id_artist
INNER JOIN SpotifyClone.music as m
ON al.id_album = m.id_album
LEFT JOIN SpotifyClone.favorites as fav
ON m.id_music = fav.id_music
WHERE art.id_artist = art.id_artist
GROUP BY art.artist
ORDER BY COUNT(fav.id_music) DESC, artista;