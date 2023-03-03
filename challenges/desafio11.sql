SELECT al.album, COUNT(*) as favoritadas
FROM SpotifyClone.music as m
INNER JOIN SpotifyClone.album as al
ON m.id_album = al.id_album
INNER JOIN SpotifyClone.favorites as f
ON m.id_music = f.id_music
GROUP BY al.album
ORDER BY favoritadas DESC, album
LIMIT 3;