--
-- Database: `senai`
--

CREATE DATABASE IF NOT EXISTS  senai;
USE senai;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

# NOT NULL - significa que não pode ser nulo, tem que preencher.

CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `primeiroNome` varchar(60) NOT NULL,
  `sobrenome` varchar(60) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `CEP` int(11) NOT NULL,
  `salario` decimal(6,2) NOT NULL
);

--
-- Inserindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id`, `primeiroNome`, `sobrenome`, `cidade`, `CEP`, `salario`) VALUES
(1, 'Capitão', 'América', 'Guabiruba', 88360000, 4000.99),
(2, 'Homem', 'de Ferro', 'Gaspar', 89114206, 3599.55),
(3, 'Incrível', 'Hulk', 'Nova Trento', 88270000, 1250),
(4, 'Mulher ', 'Maravilha', 'Itajaí', 88301000, 3700),
(5, 'Capitã', 'Marvel', 'Balneário Camboriú', 88330118, 3700),
(6, 'Viúva', 'Negra', 'Brusque', 88353202, 4000),
(7, 'Peter', 'Quill', 'Blumenau', 89010602, 4000),
(8, 'Máquina', 'de Combate', 'Balneário Camboriú', 88330250, 7899.99);

SELECT * FROM cliente;

-- Lista os banco de dados existente no servidor
SHOW DATABASES;

-- Mostar tabelas de um determinado banco de dados 
SHOW TABLES FROM senai;

-- Para ver as colunas de uma determinada tabela
SHOW COLUMNS FROM cliente;

-- Selecionar e mostar uma coluna em especifica 
SELECT primeiroNome from cliente;

-- Selecionar duas colunas 
SELECT primeiroNome AS Primeiro_Nome, cidade AS Cidade FROM cliente;

-- Para selecionar todas as colunas 
SELECT * FROM cliente;

-- Mostrar dados sem reptição 
SELECT DISTINCT cidade FROM cliente ORDER BY cidade;

-- Limitando o numero de linhas na consulta 
SELECT id,sobrenome,cep FROM cliente LIMIT 5;

/*o primeiro número, indica de onde vai iniciar a contagem, por exemplo
(3,2) o 3 indica que a contagem vai iniciar no 4
*/
SELECT id,sobrenome,cep FROM cliente LIMIT 3,2;

-- Ordenando a consulta pela coluna 
SELECT primeiroNome, sobrenome FROM cliente 
ORDER BY sobrenome;

-- Ordenamento em ordem descendente 
SELECT primeiroNome, sobrenome FROM cliente 
ORDER BY sobrenome DESC;

-- Ordenamento em ordem ascendente 
SELECT primeiroNome, sobrenome FROM cliente 
ORDER BY sobrenome ASC;

-- Filtrando os resultados com a cláusula WHERE
SELECT * FROM cliente WHERE id = 7;

-- Filtrando resultados dentro de uma faixa de valores
-- utilizando o between
SELECT * FROM cliente WHERE primeiroNome 
BETWEEN "Homem " AND "Peter" ORDER BY primeiroNome;

SELECT * FROM cliente WHERE id BETWEEN 3 AND 6;

-- Comando semelhante, uso do Between
SELECT * FROM cliente WHERE id >= 3 AND id <= 6;

-- Concaternar strings 
SELECT concat(primeiroNome," ------- ", sobrenome)
AS 'Nome Comleto'
FROM cliente;

-- Funções no SQL raiz quadrada(SQRT) e aredondamento(ROUND)
SELECT primeiroNome, ROUND(SQRT(salario),2)
FROM cliente;

-- Expreções matemáticas
SELECT primeiroNome, salario, ROUND(SQRT(salario))
AS  Prêmio, salario + ROUND(SQRT(salario)) AS Bonificação
FROM cliente;

-- Função Agregadora média (AVG)
-- Retorna apenas uma linha por agrupamento.
SELECT AVG(salario) AS "Média Salarial" FROM cliente;

-- Nome e salário das pessoa com salário acima da média com Sub consulta
SELECT CONCAT(primeiroNome," ",sobrenome) AS Nome, salario 
FROM cliente
WHERE salario > (SELECT AVG(salario) FROM cliente);

-- Contagem dos registros - Função agregadora.
SELECT COUNT(*) FROM cliente;

-- Agrupando cliente por cidade 
SELECT cidade, COUNT(*) FROM cliente
GROUP BY cidade;

-- Para filtar o agrupamento 
SELECT cidade, COUNT(*) AS quantidade FROM cliente
GROUP BY cidade
HAVING quantidade = 2;

