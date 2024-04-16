CREATE DATABASE AquaMate;
USE AquaMate;

ALTER DATABASE AquaMate CHARACTER SET utf8;

CREATE TABLE Usuario (
	Usuario_ID INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Dados_Usuario (
	Dados_Usuario_ID INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Meta_Manual (
	Meta_Manual_ID INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Meta_Auto (
	Meta_Automatica_ID INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Registro_Consumo (
	Registro_Consumo_ID INT AUTO_INCREMENT PRIMARY KEY
);

ALTER TABLE Usuario 
	ADD COLUMN Nome VARCHAR(255),
	ADD COLUMN Email VARCHAR(255),
	ADD COLUMN Senha VARCHAR(10),
    
	ADD COLUMN Dados_Usuario_ID INT,
	ADD FOREIGN KEY (Dados_Usuario_ID) REFERENCES Dados_Usuario(Dados_Usuario_ID);

ALTER TABLE Dados_Usuario 
	ADD COLUMN Data_Nascimento DATE,
    	ADD COLUMN Apelido VARCHAR(255),
    	ADD COLUMN CPF VARCHAR(11),
    	ADD COLUMN Telefone VARCHAR(12),
    	ADD COLUMN Peso_inicial DECIMAL(3,2),
    	ADD COLUMN Peso_atual DECIMAL(3,2),
    	ADD COLUMN Idade INT,
    	ADD COLUMN Altura FLOAT,
    	ADD COLUMN Tipo_Meta ENUM('Auto', 'Manual');
    
ALTER TABLE Registro_Consumo
	ADD COLUMN Data_Registro DATE,
    	ADD COLUMN Quantidade_Consumida INT,
    	ADD COLUMN Percentual_atingido FLOAT,
    	ADD COLUMN Streak INT,
    
    	ADD COLUMN Registro_Consumo_ID INT,
	ADD FOREIGN KEY (Usuario_ID) REFERENCES Usuario(Usuario_ID);
    
ALTER TABLE Meta_Auto
	ADD COLUMN Auto_Meta INT,
    
    	ADD COLUMN Dados_Usuario_ID INT,
	ADD FOREIGN KEY (Dados_Usuario_ID) REFERENCES Dados_Usuario(Dados_Usuario_ID);
    
ALTER TABLE Meta_Manual
	ADD COLUMN Manual_Meta INT, 
    
    	ADD COLUMN Dados_Usuario_ID INT,
	ADD FOREIGN KEY (Dados_Usuario_ID) REFERENCES Dados_Usuario(Dados_Usuario_ID);
    
	
