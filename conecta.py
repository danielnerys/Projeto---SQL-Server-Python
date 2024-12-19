import pyodbc
import pandas as pd
import matplotlib.pyplot as plt
# Conexão com autenticação integrada
#servidor local
# server = 'DESKTOP-9CDNUB4\\SQLEXPRESS'
# database = 'projeto'
# driver = 'ODBC Driver 17 for SQL Server'

server = '172.16.66.16'  # Exemplo: 'localhost\\SQLEXPRESS'
database = 'projeto'
username = 'sa'
password = 'Senai@134'


try:
    # connection = pyodbc.connect(
    #     f"DRIVER={{{driver}}};"
    #     f"SERVER={server};"
    #     f"DATABASE={database};"
    #     f"Trusted_Connection=yes;"
    # )
    
    connection = pyodbc.connect(
        f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={
            server};DATABASE={database};UID={username};PWD={password}'
    )
    print("Conexão bem-sucedida!")
    
    ##consulta
    query_pontuacao ="""select a.nome as nome_jogador, sum(b.pontuacao) as total_pontos
    from jogador a
    inner join pontuacao b
    on a.ID_jogador = b.ID_jogador
    group by a.nome
    order by total_pontos desc;"""
    
    
    
    # realiza a query
    pontucao = pd.read_sql(query_pontuacao, connection)
    
    #transforma a query em um dataframe para analise
    df_pontuacao_df = pd.DataFrame(pontucao)
    
    # plota um grafico para analise de quem mais pontuou
    df_pontuacao_df.plot(
    kind='bar', 
    x='nome_jogador',  # Define a coluna para o eixo X
    y='total_pontos',  # Define a coluna para o eixo Y
    figsize=(8, 6),  # Define o tamanho do gráfico
    color='red',  # Cor das barras
    title='Total pontos por jogador'  # Título do gráfico
    )
    plt.xlabel('Jogador')  # Rótulo do eixo X
    plt.ylabel('Pontuação')  # Rótulo do eixo Y
    plt.xticks(rotation=40, ha= 'right')  # Rotação dos rótulos do eixo X
    plt.tight_layout()  # Ajusta o layout para evitar sobreposição
    plt.show()  # Exibe o gráfico
    
    
    
    query_total_jogo_modalidade= """SELECT 
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
    TotalJogos DESC;"""
    
    total_jogos = pd.read_sql(query_total_jogo_modalidade, connection)
    
    df_total_jogo_modalidade = pd.DataFrame(total_jogos)
    
    print(df_total_jogo_modalidade)
    
    plt.figure(figsize=(8, 8))
    plt.pie(
            df_total_jogo_modalidade['Percentual'], 
            labels=df_total_jogo_modalidade['Esporte'], 
            autopct='%1.1f%%', 
            startangle=140
        )
    plt.title('Distribuição de Jogos por Esporte')
    plt.tight_layout()
    plt.show()
    
    query_total_jogadores = """select count(nome) from jogador"""
    
    df_total_jogadores = pd.read_sql(query_total_jogadores, connection)
    
    print('Total de Jogadores participantes')
    print(df_total_jogadores)


########## Média de idade de jogadores #############


    query_media_idade = """SELECT AVG(DATEDIFF(YEAR, jogador.data_nascimento, GETDATE()) - 
           CASE 
               WHEN MONTH(jogador.data_nascimento) > MONTH(GETDATE()) OR 
                    (MONTH(jogador.data_nascimento) = MONTH(GETDATE()) AND DAY(jogador.data_nascimento) > DAY(GETDATE()))
               THEN 1 
               ELSE 0 
           END) AS media_idade
FROM jogador;"""
    media_idade = pd.read_sql(query_media_idade, connection)
    df_media_idade = pd.DataFrame(media_idade)
    print('##################### A media de idade dos 15 jogadores é ###############################')
    print(f'A media de idade dos 15 jogadores é de {df_media_idade}')


        

except Exception as e:
    print("Erro ao conectar ao banco de dados:", e)
finally:
    if 'connection' in locals() and connection is not None:
        connection.close()
