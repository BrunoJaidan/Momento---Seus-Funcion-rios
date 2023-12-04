INSERT INTO funcionarios (nome, departamento, salario) VALUES ('Seu Nome', 'Tecnologia', 5000);
INSERT INTO funcionarios (nome, departamento, salario) VALUES ('Nome Colega 1', 'Tecnologia', 4800);
INSERT INTO funcionarios (nome, departamento, salario) VALUES ('Nome Colega 2', 'Tecnologia', 5100);

SELECT COUNT(*) AS total_funcionarios FROM funcionarios;

SELECT COUNT(*) AS funcionarios_financeiro FROM funcionarios WHERE departamento = 'Finanças';

SELECT AVG(salario) AS media_salario_tecnologia FROM funcionarios WHERE departamento = 'Tecnologia';

SELECT SUM(salario) AS gastos_transportes FROM funcionarios WHERE departamento = 'Transportes';

INSERT INTO regiao (regiao_name) VALUES ('Brasil');
INSERT INTO departamento (departamento_name, regiao_id) VALUES ('Inovações', (SELECT regiao_id FROM regiao WHERE regiao_name = 'Brasil'));

INSERT INTO funcionarios (nome, estado_civil, numero_filhos, cargo, departamento, salario)
VALUES ('William Ferreira', 'Casado', 1, 'Programador', 'Inovações', (SELECT AVG(salario) FROM funcionarios WHERE departamento IN ('Administração', 'Finanças')));
INSERT INTO funcionarios (nome, estado_civil, numero_filhos, cargo, departamento, salario)
VALUES ('Fernanda Lima', 'Casado', 0, 'Desenvolvedora', 'Inovações', (SELECT AVG(salario) FROM funcionarios WHERE departamento IN ('Administração', 'Finanças')));
INSERT INTO funcionarios (nome, estado_civil, numero_filhos, cargo, departamento, salario)
VALUES ('Sumaia Azevedo', 'Casado', 2, 'Gerente', 'Inovações', (SELECT AVG(salario) FROM funcionarios WHERE departamento IN ('Administração', 'Finanças')));

SELECT regiao_name, pais_name
FROM regiao
INNER JOIN paises ON regiao.regiao_id = paises.regiao_id;

SELECT nome FROM funcionarios WHERE id = (SELECT id_pai FROM funcionarios WHERE nome = 'Joe Sciarra');

SELECT CASE WHEN numero_filhos > 0 THEN 'Sim' ELSE 'Não' END AS possui_filhos FROM funcionarios WHERE nome = 'Jose Manuel';

SELECT regiao_name, COUNT(pais_name) AS total_paises
FROM regiao
INNER JOIN paises ON regiao.regiao_id = paises.regiao_id
GROUP BY regiao_name
ORDER BY COUNT(pais_name) DESC
LIMIT 1;

SELECT f.nome AS nome_funcionario, d.nome AS nome_dependente
FROM funcionarios f
LEFT JOIN dependentes d ON f.id = d.id_funcionario;

SELECT CASE WHEN estado_civil = 'Casado' THEN 'Sim' ELSE 'Não' END AS possui_conjuge FROM funcionarios WHERE nome = 'Karen Partners';
