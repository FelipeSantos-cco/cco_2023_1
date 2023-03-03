CREATE DATABASE exemplo_constraints;

USE exemplo_constraints;

-- No MySQL existem 5 restrições
-- 1° -> PK - Valores unicos 
-- 2° -> FK - Não colocar valores inexistentes
-- 3° -> NOT NULL - Campo/Valor Obrigatório
-- 4° -> CHECK - Limitar os valores permitidos no campo;
-- 5° -> UNIQUE - Não permite que haja outro registro com o mesmo valor. Ex: CPF

CREATE TABLE funcionario(
	idFuncionario INT PRIMARY KEY AUTO_INCREMENT
    , nome VARCHAR(45) NOT NULL
    , cpf CHAR(14) UNIQUE
    , sexo CHAR(1) CHECK (sexo IN('m', 'f', 'n')) -- Sem nomear a constraint
				-- CHECK (sexo = 'm' or sexo = 'f' or sexo = 'n')
    , salario DECIMAL(7,2)
	, CONSTRAINT chkSalario CHECK (salario > 0 and salario <= 10000)
);

SELECT idFuncionario AS 'id', nome, cpf, sexo, salario FROM funcionario;

-- O comando abaixo dará erro, pois sexo não pode ser 'z'
INSERT INTO funcionario
VALUES (NULL, 'Ana Silva', '123.123.123-00', 'z', 1500);

-- O comando abaixo dará Certo :)
INSERT INTO funcionario
VALUES (NULL, 'Ana Silva', '123.123.123-00', 'f', 1500);

-- O comando abaixo dará erro, pois salario não pode ser maior que 10000
INSERT INTO funcionario
VALUES (NULL, 'Ana Silva', '123.123.123-00', 'f', 11000);

-- O comando abaixo dará erro, pois não pode ter cpf repetido
INSERT INTO funcionario
VALUES (NULL, 'João Paulo', '901.432.133-12', 'm', 6000);

