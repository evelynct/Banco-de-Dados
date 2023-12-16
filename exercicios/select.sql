-- --------------------------------------------------------------------
/* Utilizar o comando UPDATE sem WHERE (em uma tabela a sua escolha) e ajustar a tabela novamente */
-- Marcando os aniversariantes do mês na tabela de alunos

UPDATE escola.aluno
SET aniversariante = 1
WHERE MONTH(data_nascimento) = MONTH(CURDATE());
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
/* Atualize somente uma coluna de um registro com o comando/instrução UPDATE; */

UPDATE escola.aluno
SET sexo = 'm'
WHERE id_aluno = 1;
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
/* Atualize várias colunas de vários registros com o comando/instrução UPDATE; */

UPDATE escola.aluno
SET
  sexo = CASE
           WHEN sexo = 'F' THEN 'f'
           WHEN sexo = 'M' THEN 'm'
           ELSE sexo  -- Se o sexo não for 'F' ou 'M', mantenha o valor existente
         END;
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
/* Utilizar o comando IN. Qual a diferença entre os comandos IN, OR e AND? Justifique sua resposta textualmente e via código */
UPDATE escola.aluno
SET aniversariante = 1
WHERE month(data_nascimento) in (11, 12);

 -- 'IN' verifica uma lista de coisas
 -- 'OR' verifica uma condição ou outra
 -- 'AND' verifica uma coisa e outra
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
/* Utilizar o comando DELETE */
DELETE FROM escola.curso
WHERE carga_horaria < 10;
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
/*Qual a diferença entre os comandos/instruções TRUNCATE TABLE, DROP TABLE eDELETE? Justifique sua resposta textualmente e via código*/

TRUNCATE TABLE escola.aluno;	-- comando usado para limpar todos os registros de uma tabela
DROP TABLE escola.aluno;		-- registro usado para apagar toda a tabela
DELETE FROM escola.aluno WHERE nacionalidade = 'Brasil';	-- Este comando apaga um registro caso se enquadre no 'WHERE' 
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------



-- --------------------------------------------------------------------
