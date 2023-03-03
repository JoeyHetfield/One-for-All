-- Não entendi o porquê de precisar do cast nos outros além do valor 0, que estavam sim como decimais já
SELECT CAST(MIN(p.price) AS DECIMAL(10, 2)) as faturamento_minimo, CAST(MAX(p.price) AS DECIMAL (10, 2)) as faturamento_maximo, 
CAST(AVG(p.price) AS DECIMAL (10,2)) as faturamento_medio, CAST(SUM(p.price) AS DECIMAL (10, 2)) as faturamento_total
FROM SpotifyClone.plan as p
INNER JOIN SpotifyClone.users as u
ON p.id_plan = u.id_plan;
