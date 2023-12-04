-- Incluindo informações no departamento de tecnologia da empresa
INSERT INTO funcionarios (nome, departamento, salario) VALUES ('Seu Nome', 'Tecnologia', 5000);
INSERT INTO funcionarios (nome, departamento, salario) VALUES ('Nome Colega 1', 'Tecnologia', 4800);
INSERT INTO funcionarios (nome, departamento, salario) VALUES ('Nome Colega 2', 'Tecnologia', 5100);

-- Quantos funcionários temos ao total na empresa?
SELECT COUNT(*) AS total_funcionarios FROM funcionarios;

-- Quantos funcionários temos no departamento de finanças?
SELECT COUNT(*) AS funcionarios_financeiro FROM funcionarios WHERE departamento = 'Finanças';

-- Média salarial do departamento de tecnologia
SELECT AVG(salario) AS media_salario_tecnologia FROM funcionarios WHERE departamento = 'Tecnologia';

-- Gastos do departamento de Transportes em salários
SELECT SUM(salario) AS gastos_transportes FROM funcionarios WHERE departamento = 'Transportes';

-- Adicionando o departamento de Inovações no Brasil
INSERT INTO regiao (regiao_name) VALUES ('Brasil');
INSERT INTO departamento (departamento_name, regiao_id) VALUES ('Inovações', (SELECT regiao_id FROM regiao WHERE regiao_name = 'Brasil'));

-- Adicionando funcionários no departamento de Inovações
INSERT INTO funcionarios (nome, estado_civil, numero_filhos, cargo, departamento, salario)
VALUES ('William Ferreira', 'Casado', 1, 'Programador', 'Inovações', (SELECT AVG(salario) FROM funcionarios WHERE departamento IN ('Administração', 'Finanças')));
INSERT INTO funcionarios (nome, estado_civil, numero_filhos, cargo, departamento, salario)
VALUES ('Fernanda Lima', 'Casado', 0, 'Desenvolvedora', 'Inovações', (SELECT AVG(salario) FROM funcionarios WHERE departamento IN ('Administração', 'Finanças')));
INSERT INTO funcionarios (nome, estado_civil, numero_filhos, cargo, departamento, salario)
VALUES ('Sumaia Azevedo', 'Casado', 2, 'Gerente', 'Inovações', (SELECT AVG(salario) FROM funcionarios WHERE departamento IN ('Administração', 'Finanças')));

-- Regiões em que a empresa atua com seus países
SELECT regiao_name, pais_name
FROM regiao
INNER JOIN paises ON regiao.regiao_id = paises.regiao_id;

-- Joe Sciarra é filho de quem?
SELECT nome FROM funcionarios WHERE id = (SELECT id_pai FROM funcionarios WHERE nome = 'Joe Sciarra');

-- Jose Manuel possui filhos?
SELECT CASE WHEN numero_filhos > 0 THEN 'Sim' ELSE 'Não' END AS possui_filhos FROM funcionarios WHERE nome = 'Jose Manuel';

-- Região com mais países
SELECT regiao_name, COUNT(pais_name) AS total_paises
FROM regiao
INNER JOIN paises ON regiao.regiao_id = paises.regiao_id
GROUP BY regiao_name
ORDER BY COUNT(pais_name) DESC
LIMIT 1;

-- Nome de cada funcionário com seus dependentes
SELECT f.nome AS nome_funcionario, d.nome AS nome_dependente
FROM funcionarios f
LEFT JOIN dependentes d ON f.id = d.id_funcionario;

-- Karen Partners possui um(a) cônjuge?
SELECT CASE WHEN estado_civil = 'Casado' THEN 'Sim' ELSE 'Não' END AS possui_conjuge FROM funcionarios WHERE nome = 'Karen Partners';
