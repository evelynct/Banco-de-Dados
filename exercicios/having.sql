USE escola;
-- -----------------------------------------------------------------------------------------------
-- Calcule a carga horária média dos cursos e informe também o respectivo ano. Agrupe e ordene os registros pelo ano
SELECT AVG(carga_horaria) AS Media_Horario, ano_criacao AS ANO
FROM curso
GROUP BY ano_criacao
ORDER BY ano_criacao;
-- -----------------------------------------------------------------------------------------------
-- Realize uma consulta que traga o número de cursos criados além do respectivo ano. Agrupe e ordene os registros pelo ano

SELECT  COUNT(id_curso) AS Quantidade_Cursos, ano_criacao AS ano
FROM curso
GROUP BY ano_criacao
ORDER BY ano_criacao;

-- -----------------------------------------------------------------------------------------------
--  Calcule o peso e a altura média dos alunos de todos os países, exceto da Alemanha. Ordenar,agrupar pela nacionalidade.
-- Utilizar a cláusula HAVING

SELECT 	 ROUND(AVG(peso), 2) AS Media_Peso, 
		 ROUND(AVG(altura), 2) AS Media_Altura, 
         nacionalidade AS Nacionalidade 
FROM aluno
WHERE nacionalidade != 'Alemanha'
GROUP BY nacionalidade
ORDER BY nacionalidade;
-- -----------------------------------------------------------------------------------------------
-- Realizar uma consulta que traga o maior e menor peso, além do sexo. Agrupar profissão. Épossível utilizar a cláusula HAVING?

SELECT 	profissao AS Profissao, 
		MAX(peso) AS Maior_Peso, 
		MIN(peso) AS Menor_Peso
FROM aluno
GROUP BY profissao
HAVING profissao IS NOT NULL;
-- -----------------------------------------------------------------------------------------------
-- Apresentar um somatório referente ao número total de aulas por ano. Agrupar e ordenar por ano

SELECT
    ano_criacao AS Ano,
    COUNT(*) AS Total_Aulas
FROM curso
WHERE ano_criacao IS NOT NULL
GROUP BY ano_criacao
ORDER BY ano_criacao;
-- -----------------------------------------------------------------------------------------------

