SELECT DISTINCT(u.name) as pessoa_usuaria, IF(MAX(h.data_reproduce) > '2021-01-01 00:00:00', 'Ativa', 'Inativa') as status_pessoa_usuaria
FROM SpotifyClone.users as u
INNER JOIN SpotifyClone.historic as h
ON u.id_user = h.id_user
GROUP BY u.name
ORDER BY u.name;