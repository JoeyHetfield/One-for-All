SELECT u.name as pessoa_usuaria, COUNT(h.id_music) as musicas_ouvidas, ROUND(SUM(m.length) / 60, 2) as total_minutos
FROM SpotifyClone.historic as h
INNER JOIN SpotifyClone.users as u
ON h.id_user = u.id_user
INNER JOIN SpotifyClone.music as m
ON h.id_music = m.id_music
GROUP BY h.id_user
ORDER BY u.name;