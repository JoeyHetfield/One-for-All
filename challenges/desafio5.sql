SELECT m.music as cancao, COUNT(h.id_user) as reproducoes
FROM SpotifyClone.music as m
INNER JOIN SpotifyClone.historic as h
ON m.id_music = h.id_music
GROUP BY m.id_music
ORDER BY reproducoes DESC, cancao
LIMIT 2;