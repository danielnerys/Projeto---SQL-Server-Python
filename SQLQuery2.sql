--Pontuações jogadores
select a.nome as nome_jogador, sum(b.pontuacao) as total_pontos
	from jogador a
	inner join pontuacao b
	on 
	a.ID_jogador = b.ID_jogador
	group by 
	a.nome
	order by total_pontos desc;

-- Quantos jogos por esporte
select a.nome as NomeJogador, b.pontuacao, c.nome as Modalidade
from jogador a
inner join pontuacao b
on a.id_jogador = b.id_jogador
inner join jogo c
on b.id_jogo = c.id_jogo
where c.nome like 'futebol%'

select a.nome as NomeJogador, b.pontuacao, c.nome as Modalidade
from jogador a
inner join pontuacao b
on a.id_jogador = b.id_jogador
inner join jogo c
on b.id_jogo = c.id_jogo
where c.nome like 'vôlei%'

-- total de jogos por modalidade
SELECT 
    CASE
        WHEN c.nome LIKE '%Futebol%' THEN 'Futebol'
        WHEN c.nome LIKE '%Basquete%' THEN 'Basquete'
        WHEN c.nome LIKE '%Tênis%' THEN 'Tênis'
        WHEN c.nome LIKE '%Vôlei%' THEN 'Vôlei'
        WHEN c.nome LIKE '%Corrida%' THEN 'Corrida'
        WHEN c.nome LIKE '%Ciclismo%' THEN 'Ciclismo'
        WHEN c.nome LIKE '%Futsal%' THEN 'Futsal'
        WHEN c.nome LIKE '%Handebol%' THEN 'Handebol'
        WHEN c.nome LIKE '%Atletismo%' THEN 'Atletismo'
        WHEN c.nome LIKE '%Natação%' THEN 'Natação'
        ELSE 'Outros'
    END AS Esporte,
    COUNT(*) AS TotalJogos,
    (COUNT(*) * 100.0 / SUM(COUNT(*)) OVER ()) AS Percentual
FROM 
    jogo c
INNER JOIN 
    pontuacao b ON c.id_jogo = b.id_jogo
GROUP BY 
    CASE
        WHEN c.nome LIKE '%Futebol%' THEN 'Futebol'
        WHEN c.nome LIKE '%Basquete%' THEN 'Basquete'
        WHEN c.nome LIKE '%Tênis%' THEN 'Tênis'
        WHEN c.nome LIKE '%Vôlei%' THEN 'Vôlei'
        WHEN c.nome LIKE '%Corrida%' THEN 'Corrida'
        WHEN c.nome LIKE '%Ciclismo%' THEN 'Ciclismo'
        WHEN c.nome LIKE '%Futsal%' THEN 'Futsal'
        WHEN c.nome LIKE '%Handebol%' THEN 'Handebol'
        WHEN c.nome LIKE '%Atletismo%' THEN 'Atletismo'
        WHEN c.nome LIKE '%Natação%' THEN 'Natação'
        ELSE 'Outros'
    END
ORDER BY 
    TotalJogos DESC;

SELECT count(NOME)as total_jogadores FROM JOGADOR

select * from jogo
order by data_jogo desc

select min(data_jogo)as primeiro_dia, max(data_jogo) as ultimo_dia  from jogo






