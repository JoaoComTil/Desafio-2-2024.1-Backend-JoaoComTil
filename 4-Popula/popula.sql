INSERT INTO DDDS (ddd) VALUES 
('11'), ('12'), ('13'), ('14'), ('15'), ('16'), ('17'), ('18'), ('19'), 
('21'), ('22'), ('24'), ('27'), ('28'), 
('31'), ('32'), ('33'), ('34'), ('35'), ('37'), ('38'), 
('41'), ('42'), ('43'), ('44'), ('45'), ('46'), ('47'), ('48'), ('49'), 
('51'), ('53'), ('54'), ('55'), 
('61'), ('62'), ('63'), ('64'), ('65'), ('66'), ('67'), ('68'), ('69'), 
('71'), ('73'), ('74'), ('75'), ('77'), ('79'), 
('81'), ('82'), ('83'), ('84'), ('85'), ('86'), ('87'), ('88'), ('89'), 
('91'), ('92'), ('93'), ('94'), ('95'), ('96'), ('97'), ('98'), ('99');

INSERT INTO TELEFONE (num_telefone, ddd_DDDS) VALUES
('987654321', '11'),  -- São Paulo
('912345678', '21'),  -- Rio de Janeiro
('998877665', '31'),  -- Belo Horizonte
('955443322', '41'),  -- Curitiba
('977889900', '51');  -- Porto Alegre

INSERT INTO ESTADOS (sigla_estado, estado_nome) VALUES 
('AC', 'Acre'),
('AL', 'Alagoas'),
('AP', 'Amapá'),
('AM', 'Amazonas'),
('BA', 'Bahia'),
('CE', 'Ceará'),
('DF', 'Distrito Federal'),
('ES', 'Espírito Santo'),
('GO', 'Goiás'),
('MA', 'Maranhão'),
('MT', 'Mato Grosso'),
('MS', 'Mato Grosso do Sul'),
('MG', 'Minas Gerais'),
('PA', 'Pará'),
('PB', 'Paraíba'),
('PR', 'Paraná'),
('PE', 'Pernambuco'),
('PI', 'Piauí'),
('RJ', 'Rio de Janeiro'),
('RN', 'Rio Grande do Norte'),
('RS', 'Rio Grande do Sul'),
('RO', 'Rondônia'),
('RR', 'Roraima'),
('SC', 'Santa Catarina'),
('SP', 'São Paulo'),
('SE', 'Sergipe'),
('TO', 'Tocantins');


INSERT INTO ENDERECO (cep, cidade, bairro, sigla_estado_estados) VALUES
('01234000', 'São Paulo', 'Centro', 'SP'),          -- São Paulo (SP)
('20040000', 'Rio de Janeiro', 'Copacabana', 'RJ'), -- Rio de Janeiro (RJ)
('30130000', 'Belo Horizonte', 'Savassi', 'MG'),    -- Belo Horizonte (MG)
('80010000', 'Curitiba', 'Batel', 'PR'),            -- Curitiba (PR)
('70070000', 'Brasília', NULL, 'DF'); 


INSERT INTO PROPRIETARIO (cpf, data_nascimento, sexo, nome, cep_endereco, num_telefone_telefone) VALUES
('12345678901', '1980-05-15', 'Masculino', 'João Silva', '01234000', '987654321'),
('23456789012', '1990-08-20', 'Feminino', 'Maria Oliveira', '20040000', '912345678'),
('34567890123', '1975-03-10', 'Masculino', 'Carlos Souza', '30130000', '998877665'),
('45678901234', '1985-11-25', 'Feminino', 'Ana Costa', '80010000', '955443322'),
('56789012345', '1995-07-01', 'Masculino', 'Pedro Rocha', '70070000', '977889900');



INSERT INTO MODELO (modelo_nome) VALUES 
('Fusca'),
('Gol'),
('Civic'),
('Corolla'),
('Onix');


INSERT INTO CATEGORIA(categoria_nome) VALUES 
('AUTOMÓVEL'),
('MOTOCICLETA'),
('CAMINHÃO'),
('ÔNIBUS'),
('TRATOR');



INSERT INTO VEICULO (placa, ano_fabricacao, cor, chassi, idModelo_modelo, idCategoria_categoria, cpf_PROPRIETARIO) VALUES
('ABC1234', 2010, 'Azul', '9BWZZZ377VT004251', 1, 1, '12345678901'),  -- Fusca (Automóvel)
('DEF5678', 2015, 'Preto', '3VWFE21C04M000001', 3, 1, '23456789012'),  -- Gol (Automóvel)
('GHI9101', 2018, 'Branco', '1HGCM82633A000001', 3, 1, '34567890123'),  -- Civic (Automóvel)
('JKL1121', 2020, 'Prata', '2T1BU4EE6CC000001', 4, 1, '45678901234'),  -- Corolla (Automóvel)
('MNO3141', 2019, 'Vermelho', '1G1JC5SB7C4100001', 5, 1, '56789012345'); -- Onix (Automóvel)


INSERT INTO POSICAO (coordenadas) VALUES
(ST_GeomFromText('POINT(-23.550520 -46.633308)')),  
(ST_GeomFromText('POINT(-22.906847 -43.172896)')),  
(ST_GeomFromText('POINT(-19.916681 -46.934493)')),  
(ST_GeomFromText('POINT(-21.956681 -44.934493)')),  
(ST_GeomFromText('POINT(-20.916681 -45.934493)'));  


INSERT INTO LUGAR (velocidade_permitida, idPosicao_POSICAO) VALUES
(60, 1),  -- Avenida Paulista (São Paulo)
(40, 2),  -- Copacabana (Rio de Janeiro)
(50, 3),  -- Praça da Liberdade (Belo Horizonte)
(30, 4),  -- Pelourinho (Salvador)
(70, 5);  -- Esplanada dos Ministérios (Brasília)


INSERT INTO AGENTE (tempo_servico_meses, data_contracao, agente_nome) VALUES
(12, '2023-01-15', 'João Silva'),
(24, '2023-01-20', 'Maria Oliveira'),
(6, '2023-02-10', 'Carlos Souza'),
(36, '2023-02-15', 'Ana Costa'),
(18, '2023-03-01', 'Pedro Rocha');


INSERT INTO TIPO_INFRACAO (idTipo, valor, descricao) VALUES
(1, 195.23, 'Estacionar em local proibido'),
(2, 293.47, 'Ultrapassar o limite de velocidade em até 20%'),
(3, 880.41, 'Dirigir sob influência de álcool'),
(4, 130.16, 'Não usar o cinto de segurança'),
(5, 391.23, 'Avancar o sinal vermelho');



INSERT INTO INFRACAO (data_hora, placa_veiculo, matricula_agente, idLugar_lugar, idTipo_tipo_infracao) VALUES
('2023-10-01 14:30:00', 'ABC1234', '2023010001', 1, 1),
('2023-10-02 10:15:00', 'DEF5678', '2023010002', 2, 2),
('2023-10-03 22:45:00', 'GHI9101', '2023020001', 3, 3),
('2023-10-04 08:00:00', 'JKL1121', '2023020002', 4, 4),
('2023-10-05 18:20:00', 'MNO3141', '2023030001', 5, 5);


