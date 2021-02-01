CREATE TABLE Utilizadores (
	Utilizador_ID int IDENTITY(1,1) PRIMARY KEY,
	NivelPermissao_ID int,
	Nome varchar(20),
	Apelido varchar(20),
	DataNascimente date,
	Genero char(1),
	UserName varchar(15),
	Password varchar(15),
	NIF int
)

ALTER TABLE Utilizadores 
ALTER COLUMN UserName varchar(15) NOT NULL

--ALTER TABLE Utilizadores 
--ADD CONSTRAINT AK_Utilizadores UNIQUE (Utilizador_ID, UserName, NIF, NivelPermissao_ID )

--como alterar variavel para nao unica

CREATE TABLE NiveisPermissao (
	NivelPermissao_ID int IDENTITY(1,1) PRIMARY KEY,
	NivelPermissao varchar(15),
)

CREATE	TABLE MetodosAutenticacaoUtilizadores (
	MetodoAutenticacao_ID int UNIQUE NOT NULL,
	Utilizador_ID int UNIQUE NOT NULL
)

CREATE	TABLE MetodosAutenticacao (
	MetodoAutenticacao_ID int IDENTITY(1,1) PRIMARY KEY,
	MetodoAutenticacao varchar(20)
)

CREATE	TABLE Mediadores (
	Mediador_ID int IDENTITY(1,1) PRIMARY KEY,
	Mediador varchar(25),
	Agencia_ID int UNIQUE NOT NULL
)

CREATE	TABLE Agencias (
	Agencia_ID int IDENTITY(1,1) PRIMARY KEY,
	NomeAgencia varchar(25) NOT NULL,
	Localidade varchar(25) NOT NULL,
	nome_cod_postal int,
	ext_cod_postal int
)

CREATE	TABLE MediadoresImoveis (
	Mediador_ID int UNIQUE NOT NULL,
	CodImovel varchar(20) UNIQUE NOT NULL,
	
)

CREATE	TABLE CODIGOS_POSTAL (
	nome_cod_postal char(4),
	ext_cod_postal char(3),
	PRIMARY KEY(nome_cod_postal,ext_cod_postal),
	cod_distrito char(2),
	cod_concelho char(2),
	cod_localidade char(2),
	nome_localidade varchar(25)
)

ALTER TABLE CODIGOS_POSTAL
DROP COLUMN nome_localidade

ALTER TABLE CODIGOS_POSTAL
ADD nome_localidade varchar(25)

CREATE	TABLE Concelhos (
	cod_distrito char(2) ,
	cod_concelho char(2),
	PRIMARY KEY(cod_distrito,cod_concelho),
	nome_distrito varchar(25)
)


CREATE	TABLE Distritos (	
	cod_distrito char(2) PRIMARY KEY,
	nome_distrito varchar(25)
)

ALTER TABLE Distritos
DROP COLUMN cod_concelho

ALTER TABLE Concelhos
DROP COLUMN nome_concelho

ALTER TABLE Concelhos
ADD nome_concelho varchar(25)

ALTER TABLE Utilizadores
   ADD CONSTRAINT FK_Utilizadores_NivelPermissao_ID FOREIGN KEY (NivelPermissao_ID)
      REFERENCES NiveisPermissao (NivelPermissao_ID)

ALTER TABLE MetodosAutenticacaoUtilizadores
	ADD CONSTRAINT FK_MetodosAutenticacaoUtilizadores_MetodosAutenticacao FOREIGN KEY (MetodoAutenticacao_ID)
		REFERENCES MetodosAutenticacao (MetodoAutenticacao_ID)

ALTER TABLE MetodosAutenticacaoUtilizadores
	ADD CONSTRAINT FK_MetodosAutenticacaoUtilizadores_Utilizadores FOREIGN KEY (Utilizador_ID)
		REFERENCES Utilizadores (Utilizador_ID)

ALTER TABLE Mediadores
	ADD CONSTRAINT FK_Mediadores_Utilizadores FOREIGN KEY (Mediador_ID)
		REFERENCES Utilizadores (Utilizador_ID)

ALTER TABLE Mediadores
	ADD CONSTRAINT FK_Mediadores_Agencias FOREIGN KEY (Agencia_ID)
		REFERENCES Agencias (Agencia_ID)

ALTER TABLE Agencias
	ADD CONSTRAINT FK_Agencias_CODIGOS_POSTAL FOREIGN KEY (nome_cod_postal,ext_cod_postal)
		REFERENCES CODIGOS_POSTAL (nome_cod_postal,ext_cod_postal)

ALTER TABLE CODIGOS_POSTAL
	ADD CONSTRAINT FK_CODIGOS_POSTAL_Concelhos FOREIGN KEY (cod_distrito, cod_concelho)
		REFERENCES Concelhos (cod_distrito, cod_concelho)

ALTER TABLE Concelhos
	ADD CONSTRAINT FK_Concelhos_Distritos FOREIGN KEY (cod_distrito)
		REFERENCES Distritos (cod_distrito)

ALTER TABLE MediadoresImoveis
	ADD CONSTRAINT FK_MediadoresImoveis_Mediadores FOREIGN KEY (Mediador_ID)
		REFERENCES Mediadores (Mediador_ID)

CREATE	TABLE Imoveis (	
	CodImovel varchar(20) PRIMARY KEY,
	Detalhe_ID int,
	UnidadeVenda_ID int,
	CategoriaProduto_ID int,
	nome_cod_postal int,
	ext_cod_postal int,
	Angariador_ID int,
	NomeImovel varchar(50),
	Preco decimal,
	DescricaoCurta varchar(100),
	DescricaoLonga varchar(255),
	ContactoTelefonicoAgente int,
	Disponibilidade bit,
	ArrendaOuVenda char
)

ALTER TABLE MetodosAutenticacaoUtilizadores
ADD UNIQUE (MetodoAutenticacao_ID, Utilizador_ID);

CREATE	TABLE CategoriasImoveis (	
	CategoriaProduto_ID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	SubCategoriaImovel_ID int NOT NULL FOREIGN KEY REFERENCES CategoriasImoveis(CategoriaProduto_ID),
	CategoriaImovel varchar
)

CREATE	TABLE Detalhes (	
	Detalhe_ID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	AreaBruta varchar(15) NOT NULL,
	AreaUtil varchar(15) NOT NULL,
	TotalDoLote int NOT NULL,
	AnoConstrucao int NOT NULL,
	NumQuartos int NOT NULL,
	NumWC int NOT NULL,
	Piso varchar(15),
	NumEstacionamento int,
	DescricaoEstacionamento varchar(10),
	Elevador bit,
	EficienciaEnergetica char(1)
)

CREATE	TABLE MensagemDoCliente (	
	MensagemDoCliente_ID int IDENTITY(1,1) PRIMARY KEY,
	email varchar(25) NOT NULL,
	MensagemDoCliente varchar(255),
	ContactoTelefonico char(9),
	CodImovel varchar(20)
)

CREATE	TABLE Videos (	
	Video_ID int IDENTITY(1,1) PRIMARY KEY,
	Videos varchar(15),
	CodImovel varchar(20)
)

CREATE	TABLE Imagens (	
	Imagem_ID int IDENTITY(1,1) PRIMARY KEY,
	Imagem varchar(15),
	CodImovel varchar(20)
)

CREATE	TABLE UnidadesVenda (	
	UnidadeVenda_ID int IDENTITY(1,1) PRIMARY KEY,
	UnidadeVenda varchar(15)
)

ALTER TABLE Videos
	ADD CONSTRAINT FK_Videos_Imoveis FOREIGN KEY (CodImovel)
		REFERENCES Imoveis (CodImovel)

ALTER TABLE Imagens
	ADD CONSTRAINT FK_Imagens_Imoveis FOREIGN KEY (CodImovel)
		REFERENCES Imoveis (CodImovel)

ALTER TABLE Imoveis
	ADD CONSTRAINT FK_Imoveis_UnidadesVenda FOREIGN KEY (UnidadeVenda_ID)
		REFERENCES UnidadesVenda (UnidadeVenda_ID)

ALTER TABLE MensagemDoCliente
	ADD CONSTRAINT FK_MensagemDoCliente_Imoveis FOREIGN KEY (CodImovel)
		REFERENCES Imoveis (CodImovel)

ALTER TABLE Imoveis
	ADD CONSTRAINT FK_Imoveis_Detalhes FOREIGN KEY (Detalhe_ID)
		REFERENCES Detalhes (Detalhe_ID)


ALTER TABLE Imoveis
	ADD CONSTRAINT FK_Imoveis_CategoriasImoveis FOREIGN KEY (CategoriaProduto_ID)
		REFERENCES CategoriasImoveis (CategoriaProduto_ID)

ALTER TABLE Imoveis
	ADD CONSTRAINT FK_Imoveis_CODIGOS_POSTAL FOREIGN KEY (nome_cod_postal, ext_cod_postal)
		REFERENCES CODIGOS_POSTAL (nome_cod_postal, ext_cod_postal)

ALTER TABLE MediadoresImoveis
	ADD CONSTRAINT FK_MediadoresImoveis_Imoveis FOREIGN KEY (CodImovel)
		REFERENCES Imoveis (CodImovel)