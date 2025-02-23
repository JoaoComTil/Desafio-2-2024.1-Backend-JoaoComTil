create database detranDB;
use detranDB;

CREATE TABLE DDDS (
    ddd CHAR(2) unique not null 
);

create table TELEFONE(
num_telefone varchar(9) not null, -- pensando em em numeros que começam com o 9
ddd_DDDS char(2),


constraint FK_DDDS_ddd
foreign key (ddd_DDDS) references DDDS(ddd),

primary key(num_telefone)
);

create table ESTADOS(
sigla_estado char(2) not null,
estado_nome varchar(50) not null,

primary key(sigla_estado)
);

create table ENDERECO(
cep char(8) not null,
cidade varchar(30) not null,
bairro varchar(30),			-- não obrigatorio por alguns lugares, pro exemplo em brasilia, não terem um "bairro" definido.
sigla_estado_estados CHAR(2) NOT NULL,

constraint FK_ESTADOS_sigla_estado
foreign key (sigla_estado_estados) references ESTADOS (sigla_estado),

primary key(cep)
);



create table PROPRIETARIO(
cpf char(11) unique not null ,
data_nascimento date not null, -- apenas tem data de nascimento e não idade para não ser prolixo nos dados
sexo enum('Masculino', 'Feminino', 'Outro', 'Não Informado', 'Prefiro não dizer'),
nome varchar(60) not null,
cep_endereco CHAR(8),
num_telefone_telefone VARCHAR(9),


constraint FK_ENDERECO_cep
foreign key(cep_endereco) references ENDERECO(cep),
constraint FK_TELEFONE_num_telefone
foreign key(num_telefone_telefone) references TELEFONE(num_telefone),

primary key(cpf)
);


INSERT INTO PROPRIETARIO (cpf, data_nascimento, sexo, nome, cep_endereco, num_telefone_telefone) VALUES
('12345678901', '1980-05-15', 'Masculino', 'João Silva', '01234000', '987654321'),
('23456789012', '1990-08-20', 'Feminino', 'Maria Oliveira', '20040000', '912345678'),
('34567890123', '1975-03-10', 'Masculino', 'Carlos Souza', '30130000', '998877665'),
('45678901234', '1985-11-25', 'Feminino', 'Ana Costa', '80010000', '955443322'),
('56789012345', '1995-07-01', 'Masculino', 'Pedro Rocha', '70070000', '977889900');

create table MODELO(
idModelo int auto_increment not null,
modelo_nome varchar(30) not null,

primary key (idModelo)
);


create table CATEGORIA(
idCategoria int auto_increment not null,
categoria_nome varchar(20),

primary key (idCategoria)
);


create table VEICULO(
placa varchar(7) not null unique,
ano_fabricacao int not null,
cor varchar(10) not null,
chassi varchar(17) not null unique,
cpf_proprietario char(11) not null unique,
idCategoria_categoria int,
idModelo_modelo int,

constraint FK_PROPRIETARIO_cpf
foreign key (cpf_proprietario) references PROPRIETARIO(cpf),

constraint FK_CATEGORIA_idCategoria
foreign key (idCategoria_categoria) references CATEGORIA(idCategoria),

constraint FK_MODELO_idModelo
foreign key (idModelo_modelo) references MODELO(idModelo),

primary key (placa)
);



create table POSICAO(
idPosicao int auto_increment not null,
coordenadas point not null,

primary key(idPosicao)
);



create table LUGAR(
idLugar int auto_increment not null,
velocidade_permitida smallint,
idPosicao_posicao int,

constraint FK_POSICAO_idPosicao
foreign key (idPosicao_posicao) references POSICAO(idPosicao),

primary key (idLugar)
);



create table AGENTE(
matricula varchar(12) unique not null, -- derivado da data de contratacao + ordem de contratacao
tempo_servico_meses smallint, 
data_contracao date not null,
agente_nome varchar(60) not null,

primary key(matricula)
);

DELIMITER $$

CREATE PROCEDURE gerar_matricula_agente(IN data_contracao DATE, IN nome VARCHAR(60), OUT nova_matricula VARCHAR(10))
BEGIN
    DECLARE ano_mes CHAR(6);
    DECLARE sequencial INT;
    DECLARE sequencial_formatado CHAR(4);

    -- Extrai o ano e o mês da data de contratação (formato AAAAMM)
    SET ano_mes = DATE_FORMAT(data_contracao, '%Y%m');

    -- Encontra o próximo número sequencial disponível para o ano/mês
    SELECT COALESCE(MAX(CAST(SUBSTRING(matricula, 7) AS UNSIGNED)), 0) + 1 INTO sequencial
    FROM AGENTE
    WHERE matricula LIKE CONCAT(ano_mes, '%');

    -- Formata o número sequencial com 4 dígitos (ex: 0001)
    SET sequencial_formatado = LPAD(sequencial, 4, '0');

    -- Concatena o ano/mês com o número sequencial
    SET nova_matricula = CONCAT(ano_mes, sequencial_formatado);
END$$

DELIMITER ;



DELIMITER $$

CREATE TRIGGER before_insert_agente BEFORE INSERT ON AGENTE
FOR EACH ROW
BEGIN
    DECLARE nova_matricula VARCHAR(10);

    -- Chama o procedimento para gerar a matrícula
    CALL gerar_matricula_agente(NEW.data_contracao, NEW.agente_nome, nova_matricula);

    -- Atribui a nova matrícula ao registro que está sendo inserido
    SET NEW.matricula = nova_matricula;
END$$

DELIMITER ;


create table TIPO_INFRACAO(
idTipo smallint auto_increment not null,
valor decimal(9,2) not null,
descricao text,

primary key(idTipo)
);


create table INFRACAO(
idInfracao int auto_increment not null,
data_hora datetime, -- Não colocar como obrigatório
velocidade_identificada smallint, -- Não obrigatorio pois não são todas as infrações que tem como base a velocidade
placa_veiculo varchar(7),
matricula_agente varchar(12),
idLugar_lugar int,
idTipo_tipo_infracao smallint,

constraint FK_VEICULO_placa
foreign key (placa_veiculo) references VEICULO (placa),
constraint FK_AGENTE_matricula
foreign key (matricula_agente) references AGENTE (matricula),
constraint FK_LUGAR_idLugar
foreign key (idLugar_lugar) references LUGAR (idLugar),
constraint FK_TIPO_INFRACAO_idTipo
foreign key (idTipo_tipo_infracao) references TIPO_INFRACAO (idTipo),


primary key(idInfracao)
);
