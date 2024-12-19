-- Criação das tabelas
CREATE DATABASE projeto

use projeto
go
-- Tabela Jogador
CREATE TABLE Jogador (
    ID_Jogador INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Data_Nascimento DATE,
    Email VARCHAR(100),
    Equipe VARCHAR(50)
);

-- Tabela Jogo
CREATE TABLE Jogo (
    ID_Jogo INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Data_Jogo DATE NOT NULL,
    Local VARCHAR(100)
);

-- Tabela Participação
CREATE TABLE Participacao (
    ID_Participacao INT IDENTITY(1,1) PRIMARY KEY,
    ID_Jogo INT,
    ID_Jogador INT,
    FOREIGN KEY (ID_Jogo) REFERENCES Jogo(ID_Jogo),
    FOREIGN KEY (ID_Jogador) REFERENCES Jogador(ID_Jogador)
);

-- Tabela Pontuação
CREATE TABLE Pontuacao (
    ID_Pontuacao INT IDENTITY(1,1) PRIMARY KEY,
    ID_Jogo INT,
    ID_Jogador INT,
    Pontuacao INT NOT NULL,
    Posicao_Final INT,
    FOREIGN KEY (ID_Jogo) REFERENCES Jogo(ID_Jogo),
    FOREIGN KEY (ID_Jogador) REFERENCES Jogador(ID_Jogador)
);

-- Inserção de Jogos
INSERT INTO Jogo (Nome, Data_Jogo, Local) VALUES
('Futebol - Campeonato Nacional', '2024-01-15', 'Estádio Nacional'),
('Basquete - Liga Nacional', '2024-01-20', 'Ginásio Central'),
('Tênis - Torneio Internacional', '2024-01-25', 'Arena Internacional'),
('Vôlei - Superliga', '2024-02-01', 'Ginásio do Maracanã'),
('Corrida - Maratona São Paulo', '2024-02-10', 'Avenida Paulista'),
('Futebol - Copa do Mundo', '2024-06-12', 'Estádio Maracanã'),
('Basquete - Copa do Mundo', '2024-07-08', 'Ginásio Olímpico'),
('Ciclismo - Tour de France', '2024-07-15', 'França'),
('Tênis - Wimbledon', '2024-07-20', 'All England Club'),
('Futebol - Copa América', '2024-06-20', 'Estádio Mineirão'),
('Futsal - Campeonato Paulista', '2024-03-05', 'Ginásio do Ibirapuera'),
('Handebol - Campeonato Nacional', '2024-04-01', 'Ginásio Nacional'),
('Basquete - NBA Finals', '2024-06-10', 'Staples Center'),
('Atletismo - Campeonato Brasileiro', '2024-05-25', 'Estádio do Maracanã'),
('Natação - Campeonato Internacional', '2024-08-03', 'Piscina Olímpica');

-- Inserção de Jogadores
INSERT INTO Jogador (Nome, Data_Nascimento, Email, Equipe) VALUES
('João Silva', '1995-05-12', 'joao.silva@email.com', 'Equipe A'),
('Maria Oliveira', '1992-03-25', 'maria.oliveira@email.com', 'Equipe B'),
('Carlos Souza', '1994-08-17', 'carlos.souza@email.com', 'Equipe A'),
('Ana Costa', '1996-11-02', 'ana.costa@email.com', 'Equipe C'),
('Lucas Pereira', '1990-07-30', 'lucas.pereira@email.com', 'Equipe B'),
('Beatriz Almeida', '1993-12-15', 'beatriz.almeida@email.com', 'Equipe C'),
('Felipe Martins', '1994-02-10', 'felipe.martins@email.com', 'Equipe A'),
('Rafael Santos', '1995-06-21', 'rafael.santos@email.com', 'Equipe C'),
('Mariana Lopes', '1996-01-09', 'mariana.lopes@email.com', 'Equipe B'),
('Gabriel Costa', '1991-09-12', 'gabriel.costa@email.com', 'Equipe A'),
('Juliana Rodrigues', '1994-04-05', 'juliana.rodrigues@email.com', 'Equipe C'),
('Thiago Almeida', '1993-11-18', 'thiago.almeida@email.com', 'Equipe B'),
('Fernanda Silva', '1995-08-30', 'fernanda.silva@email.com', 'Equipe A'),
('Eduardo Pereira', '1992-09-22', 'eduardo.pereira@email.com', 'Equipe C'),
('Marcos Souza', '1994-06-25', 'marcos.souza@email.com', 'Equipe B');

-- Inserção de Participações (Jogadores participando de Jogos)
INSERT INTO Participacao (ID_Jogo, ID_Jogador) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), -- Futebol - Campeonato Nacional
(2, 5), (2, 6), (2, 7), (2, 8), -- Basquete - Liga Nacional
(3, 1), (3, 3), (3, 9), (3, 5), -- Tênis - Torneio Internacional
(4, 2), (4, 6), (4, 10), (4, 11), -- Vôlei - Superliga
(5, 7), (5, 8), (5, 12), (5, 13), -- Corrida - Maratona São Paulo
(6, 9), (6, 10), (6, 11), (6, 14), -- Futebol - Copa do Mundo
(7, 1), (7, 2), (7, 15), (7, 3), -- Basquete - Copa do Mundo
(8, 3), (8, 4), (8, 5), (8, 6), -- Ciclismo - Tour de France
(9, 7), (9, 8), (9, 9), (9, 10), -- Tênis - Wimbledon
(10, 11), (10, 12), (10, 13), (10, 14), -- Futebol - Copa América
(11, 15), (11, 1), (11, 5), (11, 6), -- Futsal - Campeonato Paulista
(12, 2), (12, 7), (12, 8), (12, 9), -- Handebol - Campeonato Nacional
(13, 10), (13, 11), (13, 12), (13, 13), -- Basquete - NBA Finals
(14, 6), (14, 2), (14, 5), (14, 14), -- Atletismo - Campeonato Brasileiro
(15, 3), (15, 8), (15, 9), (15, 10); -- Natação - Campeonato Internacional

-- Inserção de Pontuações (Jogadores e suas pontuações nos Jogos)
INSERT INTO Pontuacao (ID_Jogo, ID_Jogador, Pontuacao, Posicao_Final) VALUES
(1, 1, 20, 1), (1, 2, 15, 2), (1, 3, 18, 3), (1, 4, 10, 4), -- Futebol - Campeonato Nacional
(2, 5, 25, 1), (2, 6, 18, 2), (2, 7, 12, 3), (2, 8, 14, 4), -- Basquete - Liga Nacional
(3, 1, 22, 1), (3, 3, 19, 2), (3, 9, 16, 3), (3, 5, 14, 4), -- Tênis - Torneio Internacional
(4, 2, 10, 1), (4, 6, 9, 2), (4, 10, 7, 3), (4, 11, 6, 4), -- Vôlei - Superliga
(5, 7, 30, 1), (5, 8, 25, 2), (5, 12, 20, 3), (5, 13, 15, 4), -- Corrida - Maratona São Paulo
(6, 9, 30, 1), (6, 10, 28, 2), (6, 11, 22, 3), (6, 14, 20, 4), -- Futebol - Copa do Mundo
(7, 1, 35, 1), (7, 2, 30, 2), (7, 15, 25, 3), (7, 3, 20, 4), -- Basquete - Copa do Mundo
(8, 3, 10, 1), (8, 4, 8, 2), (8, 5, 5, 3), (8, 6, 4, 4), -- Ciclismo - Tour de France
(9, 7, 12, 1), (9, 8, 10, 2), (9, 9, 8, 3), (9, 10, 6, 4), -- Tênis - Wimbledon
(10, 11, 22, 1), (10, 12, 20, 2), (10, 13, 18, 3), (10, 14, 15, 4), -- Futebol - Copa América
(11, 15, 18, 1), (11, 1, 16, 2), (11, 5, 14, 3), (11, 6, 12, 4), -- Futsal - Campeonato Paulista
(12, 2, 25, 1), (12, 7, 20, 2), (12, 8, 18, 3), (12, 9, 15, 4), -- Handebol - Campeonato Nacional
(13, 10, 30, 1), (13, 11, 28, 2), (13, 12, 25, 3), (13, 13, 20, 4), -- Basquete - NBA Finals
(14, 6, 22, 1), (14, 2, 20, 2), (14, 5, 18, 3), (14, 14, 15, 4), -- Atletismo - Campeonato Brasileiro
(15, 3, 18, 1), (15, 8, 15, 2), (15, 9, 12, 3), (15, 10, 10, 4); -- Natação - Campeonato Internacional

