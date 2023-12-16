-- --------------------------------------------------------------------------------------
/* Crie uma View onde se tenha: 
	
    nome do aluno,		 		e-mail do aluno,		data da matrícula,		 		nome do curso,		 título da seção,
    pergunta do exercício,		 explicação,		  	resposta dada pelo aluno, 		 resposta oficial,   respectiva nota do aluno. 
    
Além disso, buscar somente os alunos que se matricularam antes de 01/10/2013 e garantir que tal data não seja nula. 
Por fim, é solicitado que os dados sejamagrupados pelo nome do aluno e ordenados de forma descendente. 
Utilizar os três tipos de joins(INNER JOIN, LEFT JOIN, RIGHT JOIN) vistos em aula e explicar a diferença entre eles. */

CREATE VIEW Correcao_Provas		AS


SELECT 
		aluno.nome AS Nome_Aluno,
        aluno.email AS Email,
        aluno.data_matricula AS Data_Matricula,
        curso.nome AS Curso,
        curso.secao AS Secao,
        exercicio.pergunta AS Pergunta,
        exercicio.descricao AS Descricao,
        exercicio.resposta_aluno AS Resposta_Aluno,
        exercicio.resposta_correta AS Resposta_Correta,
        aluno.nota AS Nota_Aluno,
        CASE WHEN exercicio.resposta_aluno = exercicio.resposta_correta THEN 1 ELSE 0 END AS Pontuacao_Exercicio

                
FROM	aluno

INNER JOIN	
		curso on aluno.id_curso = curso.id_curso
INNER JOIN	
		exercicio on exercicio.id_curso = curso.id_curso				
WHERE
		aluno.nome IS NOT NULL;
		AND aluno.data_matricula < '2013-10-01'
		AND aluno.data_matricula IS NOT NULL
ORDER BY aluno.nome DESC;
-- --------------------------------------------------------------------------------------        
/* Altere a View criada acima adicionando a informação referente ao tipo da matrícula */

CREATE OR REPLACE VIEW Correcao_Provas AS

SELECT 
    aluno.nome AS Nome_Aluno,
    aluno.email AS Email,
    aluno.data_matricula AS Data_Matricula,
    curso.nome AS Curso,
    curso.secao AS Secao,
    exercicio.pergunta AS Pergunta,
    exercicio.descricao AS Descricao,
    exercicio.resposta_aluno AS Resposta_Aluno,
    exercicio.resposta_correta AS Resposta_Correta,
    aluno.nota AS Nota_Aluno,
    matricula.tipo AS Tipo_Matricula,
    CASE WHEN exercicio.resposta_aluno = exercicio.resposta_correta THEN 1 ELSE 0 END AS Pontuacao_Exercicio

FROM aluno

-- INNER JOIN
INNER JOIN curso ON aluno.id_curso = curso.id_curso
INNER JOIN exercicio ON exercicio.id_curso = curso.id_curso

-- LEFT JOIN
LEFT JOIN matricula ON aluno.id_matricula = matricula.id_matricula

WHERE
    aluno.nome IS NOT NULL
    AND aluno.data_matricula < '2013-10-01'
    AND aluno.data_matricula IS NOT NULL
ORDER BY aluno.nome DESC;                
-- --------------------------------------------------------------------------------------        
/* Crie uma View onde se tenha o nome do aluno, o e-mail do aluno e a nota do aluno. 
Caso a nota do aluno seja menor que 6,0 criar uma coluna com o texto reprovado, 
caso seja maior ou igual a 6,0 criar uma coluna onde diz que o aluno está aprovado */        

CREATE VIEW 	Nota_Aluno	AS

SELECT	
		aluno.nome AS Nome_Aluno,
        aluno.email AS Email_Aluno,
        aluno.nota AS Nota_Aluno,
        
		CASE WHEN aluno.nota < 6.0 THEN 'Reprovado' 
        ELSE 'Aprovado' END AS Situacao_Aluno
FROM
    aluno;
-- --------------------------------------------------------------------------------------        
