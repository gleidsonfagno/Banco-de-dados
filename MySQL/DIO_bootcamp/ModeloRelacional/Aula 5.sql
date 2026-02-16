# Consultas avançadas
-- JOINs : Junções
-- | Tipo       | Retorna             |
--  ---------- | ------------------- |
-- | INNER JOIN | só quem tem relação |
-- | LEFT JOIN  | tudo da esquerda    |
-- | RIGHT JOIN | tudo da direita     |

SELECT * FROM usuarios us
INNER JOIN reservas rs ON us.id = rs.id_usuario
INNER JOIN destinos ds ON rs.id_destino = ds.id;

SELECT * FROM usuarios us
LEFT JOIN reservas rs ON us.id = rs.id_usuario;

SELECT * FROM reservas rs
RIGHT JOIN destinos ds ON rs.id_destino = ds.id
;

-- Subconsultas
-- “Traga todos os destinos cujo id não aparece na coluna id_destino da tabela reservas
SELECT * FROM destinos
WHERE id NOT IN (SELECT id_destino FROM reservas);

SELECT * FROM destinos
WHERE id NOT IN (SELECT id_usuario FROM reservas);

-- Todos os usuarios que tem  reservas 
SELECT nome, (SELECT COUNT(*) from reservas WHERE id_usuario = usuarios.id) AS total_reservas FROM usuarios;