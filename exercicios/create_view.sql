-- --------------------------------------------------------------------------------------
/* Crie uma view onde as seguintes informações sejam trazidas:	

Nome do bebê;			Data de nascimento do bebê formatada no padrão brasileiro;
Nome da mãe;		 	Data de nascimento da mãe formatada no padrão brasileiro;
Estado;		 	Telefone celular;		 Estado civil;		Nome do médico;			Especialidade.

Além disso, o comprimento do bebê deve estar entre 0,5 e 0,6 e as especialidades dos médicos devem ser ginecologia ou pediatria. 
Por fim, descreva como é a realizada a chamada de uma view  */
USE maternidade;
	
CREATE VIEW Cadastro_Bebe		AS

SELECT 		bebe.nome AS Nome_Bebe,
			DATE_FORMAT(bebe.data_nascimento'%d/%m/%y') AS Data_Nascimento_Bebe,
            mae.nome AS Nome_Mae,
            DATE_FORMAT(mae.data_nascimento'%d/%m/%y') AS Data_Nascimento_Mae,
            mae.estado AS Estado,
            mae.tel_celular AS Celular,            
            mae.estado_civil AS Estado_Civil,
			medico.nome AS Nome,            
			medico.especialidade AS Nome_Especialidade            
                        				
FROM 	bebe

INNER JOIN
		mae ON bebe.id_mae_fk = mae.idmae
INNER JOIN  
		medico ON bebe.id_medico_fk = medico.idmedico
WHERE	
		bebe.comprimento BETWEEN 0.5 and 0.6 
		AND	 (medico.especialidade = 'Ginecologia' 	OR 'Pediatria');
            

-- Para realizar a chamada da view:
SELECT * FROM Cadastro_Bebe;
-- --------------------------------------------------------------------------------------
/* -- Usando UNION (remove duplicatas)
SELECT idmae AS ID, nome, data_nascimento, tel_celular, estado, estado_civil
FROM mae

UNION

SELECT idmae AS ID, nome, data_nascimento, tel_celular, estado, estado_civil
FROM mae;

-- Usando UNION ALL (inclui todas as linhas, mesmo duplicatas)
SELECT idmae AS ID, nome, data_nascimento, tel_celular, estado, estado_civil
FROM mae

UNION ALL

SELECT idmae AS ID, nome, data_nascimento, tel_celular, estado, estado_civil
FROM mae;
 */


-- --------------------------------------------------------------------------------------
