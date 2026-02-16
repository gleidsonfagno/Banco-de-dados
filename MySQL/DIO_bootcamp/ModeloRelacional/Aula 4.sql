# Normalizaçao de dados
-- Adicionar colunas de endereço à tabela "Usuarios"
ALTER TABLE usuarios ADD rua VARCHAR(100), ADD numero VARCHAR(10), ADD cidade VARCHAR(50), ADD estado VARCHAR(20);

-- Copia os dados da tabela original para a nova tabela
UPDATE usuarios
SET rua = SUBSTRING_INDEX(SUBSTRING_INDEX(endereco, ',', 1), ',', -1),
    numero = SUBSTRING_INDEX(SUBSTRING_INDEX(endereco, ',', 2), ',', -1),
    cidade = SUBSTRING_INDEX(SUBSTRING_INDEX(endereco, ',', 3), ',', -1),
    estado = SUBSTRING_INDEX(endereco, ',', -1)
WHERE id > 0;

ALTER TABLE usuarios DROP COLUMN endereco;