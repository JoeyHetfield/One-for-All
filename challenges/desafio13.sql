SELECT CASE 
	WHEN u.age < 30 THEN 'Até 30 anos'
    WHEN u.age BETWEEN 31 AND 60 THEN 'Entre 31 e 60 anos'
    WHEN u.age > 60 THEN 'Maior de 60 anos'
    END as faixa_etaria, 
COUNT(DISTINCT u.id_user) AS total_pessoas_usuarias,
COUNT(fav.id_music) AS total_favoritadas
FROM SpotifyClone.users as u
LEFT JOIN SpotifyClone.favorites as fav
ON u.id_user = fav.id_user
GROUP BY faixa_etaria;

