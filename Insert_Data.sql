SELECT * FROM DISTRITOS

SELECT * FROM Concelhos

SELECT * FROM CodigosPostal

SELECT CodigoPostal_ID, CP4, CP3, Localidade FROM CodigosPostal
WHERE CP4=3000
ORDER BY CP4

INSERT INTO Agencias (NomeAgencia, CodigoPostal_ID)
VALUES ('Coimbra 1', 73641)

SELECT * FROM Agencias

INSERT INTO MetodosAutenticacao (MetodoAutenticacao)
VALUES ('Tradicional')

SELECT * FROM MetodosAutenticacao

INSERT INTO NiveisPermissao(NivelPermissao)
VALUES ('Cliente')

SELECT * FROM NiveisPermissao

INSERT INTO Utilizadores(Nome, Apelido, DataNascimente, Genero, UserName, Password, NIF, NivelPermissao_ID)
VALUES ('Ana', 'Guiomar', '1968-03-13', 'F', 'ag', '2019221',999999981, 4)

UPDATE Utilizadores	
SET Genero = 'F'
WHERE Utilizador_ID = 8


SELECT * FROM Utilizadores

SELECT * FROM MetodosAutenticacaoUtilizadores
ORDER BY Utilizador_ID

SELECT * FROM Mediadores

INSERT INTO MetodosAutenticacaoUtilizadores (MetodoAutenticacao_ID, Utilizador_ID)
VALUES (2, 8)

INSERT INTO Mediadores(Mediador_ID, Mediador, Agencia_ID)
VALUES (12, 'Ana Guiomar', 3)

SELECT * FROM UnidadesVenda

INSERT INTO UnidadesVenda(UnidadeVenda)
VALUES ('Libras/Quinzena')

INSERT INTO CategoriasImoveis(UnidadeVenda)
VALUES ('Libras/Quinzena')

SELECT * FROM CategoriasImoveis


UPDATE CategoriasImoveis	
SET CategoriaImovel = 'Habitacao'
WHERE CategoriaProduto_ID = 1

DELETE FROM NiveisPermissao
WHERE NivelPermissao_ID =6


INSERT INTO CategoriasImoveis(CategoriaImovel, SubCategoriaImovel_ID)
VALUES ('Herdade', 10)

SELECT * FROM CodigosPostal
