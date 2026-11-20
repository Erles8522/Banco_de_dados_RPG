-- Projeto: Jogo de RPG Online
-- Banco de Dados: SQL Server
-- Linguagem de Definicao de Dados (DDL)

-- Criacao do banco de dados
CREATE DATABASE JogoRPG;
GO

-- Selecionando o banco de dados
USE JogoRPG;
GO

-- 1. Criacao da tabela USUARIOS
CREATE TABLE USUARIOS (
    UsuarioId INT IDENTITY(1,1) PRIMARY KEY,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Senha VARCHAR(255) NOT NULL
);
GO

-- 2. Criacao da tabela CLASSES
CREATE TABLE CLASSES (
    ClasseId INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descricao VARCHAR(500) NULL
);
GO

-- 3. Criacao da tabela HABILIDADES
CREATE TABLE HABILIDADES (
    HabilidadeId INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL
);
GO

-- 4. Criacao da tabela PERSONAGENS
CREATE TABLE PERSONAGENS (
    PersonagemId INT IDENTITY(1,1) PRIMARY KEY,
    NomePersonagem VARCHAR(100) NOT NULL,
    UsuarioId INT NOT NULL,
    ClasseId INT NOT NULL,

    CONSTRAINT FK_Personagens_Usuarios
        FOREIGN KEY (UsuarioId)
        REFERENCES USUARIOS(UsuarioId),

    CONSTRAINT FK_Personagens_Classes
        FOREIGN KEY (ClasseId)
        REFERENCES CLASSES(ClasseId)
);
GO

-- 5. Criacao da tabela CLASSES_HABILIDADES
CREATE TABLE CLASSES_HABILIDADES (
    ClasseId INT NOT NULL,
    HabilidadeId INT NOT NULL,

    CONSTRAINT PK_Classes_Habilidades
        PRIMARY KEY (ClasseId, HabilidadeId),

    CONSTRAINT FK_CH_Classes
        FOREIGN KEY (ClasseId)
        REFERENCES CLASSES(ClasseId),

    CONSTRAINT FK_CH_Habilidades
        FOREIGN KEY (HabilidadeId)
        REFERENCES HABILIDADES(HabilidadeId)
);
GO

-- Verificando o banco selecionado
SELECT DB_NAME() AS BancoSelecionado;

-- Verificando as tabelas criadas
SELECT name AS NomeTabela
FROM sys.tables
ORDER BY name;
GO