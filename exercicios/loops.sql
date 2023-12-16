use maternidade;

create table enfermeira_teste (
    id_enfermeira int primary key auto_increment,
    nome varchar(50),
    estado varchar(50)
);

-- inserindo dados
insert into enfermeira_teste (nome, estado) 
 values ("Luiza Silva", "SP");
insert into enfermeira_teste (nome, estado) 
 values ("Gisele Fernandes", "PE");
insert into enfermeira_teste (nome, estado) 
 values ("Fernando Nunes", "AM");
insert into enfermeira_teste (nome, estado)
 values ("Henrique Medeiros", "MG");

select * from enfermeira_teste;

start transaction;
    delete from enfermeira_teste;
    insert into enfermeira_teste (nome, estado) values ("Gabriel Medeiros", "MG");
    select * from enfermeira_teste;
rollback;		-- para não enviar um formulario caso esteja errado


delimiter $$
create procedure basico()
begin
    select * from enfermeira_teste;
end $$
delimiter ;

-- Chamando prodecimento criado
call basico();

-- Dropando prodecimento criado
drop procedure basico;

-- Criando prodecimento mais avançado ²
delimiter $$
create procedure nome_maternidade()
begin
    declare x varchar(50);
    set x = "maternidade";
    select x;
end $$
delimiter ;

-- Chamando prodecimento criado
call nome_maternidade();

-- Criando prodecimento mais avançado ³
delimiter $$
create procedure nome_maternidade_atualizada(IN nome varchar(50))
begin
    declare x varchar(50);
    set x = "maternidade";
    select x, nome;
end $$
delimiter ;

-- Chamando prodecimento criado
call nome_maternidade_atualizada("Nossa Senhora das Graças");

-- Criando prodecimento mais avançado 4
delimiter $$
create procedure retorno_consulta_mae(IN idade_param INT, OUT nome_mae VARCHAR(50))
begin
    select nome into nome_mae
    from mae
    where id_mae = idade_param;
end $$
delimiter ;

-- Chamando prodecimento 
call retorno_consulta_mae(1, @nome_mae);
select @nome_mae;

-- Criando prodecimento mais avançado com loop
delimiter $$
create procedure loop_while(OUT soma INT)
begin
    declare x int default 0;
    
    while x < 10 do
        set soma = soma + x;
        set x = x + 1;
    end while;
    
end $$
delimiter ;

-- Chamando prodecimento 
call loop_while(@soma);
select @soma;


