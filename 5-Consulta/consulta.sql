
-- EXERCICIO A)
SELECT * 
FROM VEICULO 
WHERE cpf_proprietario = '12345678901';  -- Substitua pelo CPF informado pelo usuário

-- EXERCICIO B)
SELECT * 
FROM PROPRIETARIO 
WHERE nome LIKE '%Silva%';  -- Substitua "Silva" pelo nome ou parte do nome informado pelo usuário

-- EXERCICIO C)
SELECT INF.*, VEI.*
FROM INFRACAO INF
JOIN VEICULO VEI ON INF.placa_veiculo = VEI.placa
WHERE INF.data_hora BETWEEN '2023-01-01' AND '2024-02-01';


-- EXERCICIO D)
SELECT M.modelo_nome, COUNT(V.placa) AS total_veiculos
FROM VEICULO V
JOIN MODELO M ON V.idModelo_modelo = M.idModelo
GROUP BY M.modelo_nome
ORDER BY total_veiculos DESC;