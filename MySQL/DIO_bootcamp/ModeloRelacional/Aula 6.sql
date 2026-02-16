# Funçooes agregadas
-- COUNT → contar
-- SUM   → somar
-- AVG   → média
-- MIN   → menor
-- MAX   → maior

SELECT COUNT(*) as total  FROM usuarios us
INNER JOIN reservas rs ON us.id = rs.id_usuario;

SELECT MAX(TIMESTAMPDIFF(YEAR, data_nascimento, CURRENT_DATE())) AS maior_idade FROM usuarios;

# Agrupamento de resultados
-- Ordem lógica de execução (importante!)

-- 1️ FROM
# 2️ WHERE
# 3️ GROUP BY
# 4️ HAVING
# 5️ SELECT

SELECT COUNT(*), id_destino FROM reservas GROUP BY id_destino;


# ORDENAÇÃO DE RESULTADOS (ORDER BY)

SELECT COUNT(*) AS qtd_reservas, id_destino FROM reservas GROUP BY id_destino ORDER BY qtd_reservas DESC, id_destino DESC;
