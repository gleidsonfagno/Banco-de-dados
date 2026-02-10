#-- CRUD
# (C)

INSERT INTO usuarios (id, nome, email, endereco, data_nascimento) 
VALUES (2, 'Pamela', 'teste@gmail.com', 'AV das rodas, 09, Bairro cidade nova', '2001-07-19' );
INSERT INTO usuarios (id, nome, email, endereco, data_nascimento) 
VALUES (1, 'Pamela', 'teste@email.com', 'Rua A, 123', '1990-05-10');
# usuariso 
INSERT INTO usuarios (id, nome, email, endereco, data_nascimento) VALUES
(3, 'Carlos Silva', 'carlos@email.com', 'Rua das Flores, 45', '1995-03-12'),
(4, 'Ana Souza', 'ana@email.com', 'Av Central, 200', '1988-11-25'),
(5, 'Marcos Lima', 'marcos@email.com', 'Travessa B, 78', '2000-01-08');
# destino 
INSERT INTO destinos (id, nome, descricao) VALUES
(2, 'Praia de Copacabana', 'Praia famosa no Rio de Janeiro'),
(3, 'Chapada Diamantina', 'Parque com trilhas e cachoeiras'),
(4, 'Gramado', 'Cidade turística no sul do Brasil');
# reserva 
INSERT INTO reservas (id, id_usuario, id_destino, data, status) VALUES
(2, 3, 2, '2026-03-10', 'confirmada'),
(3, 4, 3, '2026-04-15', 'pendente'),
(4, 5, 4, '2026-05-20', 'cancelada');

INSERT INTO destinos (id, nome, descricao) VALUES (1,'Prainha do Rosa', 'Linda rosa');
INSERT INTO reservas (id, id_usuario, id_destino, status, data) VALUES (1, 2, 1, 'pendente', '2026-02-9');

# (R)
SELECT * FROM usuarios;
SELECT * FROM destinos;
SELECT * FROM reservas;

SELECT * FROM usuarios WHERE id = 1 AND nome LIKE '%Pamela%';
SELECT * FROM usuarios WHERE id = 3 OR nome LIKE '%Maria%';

# (U) 
UPDATE usuarios SET id = 6 WHERE email = 'teste@email.com';

# Chaves primaris
ALTER TABLE usuarios MODIFY COLUMN id INT AUTO_INCREMENT,
ADD PRIMARY KEY (id);
ALTER TABLE destinos MODIFY COLUMN id INT AUTO_INCREMENT,
ADD PRIMARY KEY (id);
ALTER TABLE reservas MODIFY COLUMN id INT AUTO_INCREMENT,
ADD PRIMARY KEY (id);

# Chaves estrangeira
ALTER TABLE reservas ADD CONSTRAINT fk_reservas_destinos FOREIGN KEY (id_destino) REFERENCES  destinos (id) ON DELETE CASCADE;
ALTER TABLE reservas ADD CONSTRAINT fk_reservas_usuarios FOREIGN KEY (id_usuario) REFERENCES  usuarios (id) ON DELETE CASCADE;

# (D)
DELETE FROM destinos WHERE nome = 'Prainha do Rosa';

DELETE FROM usuarios WHERE id = 3;

ALTER TABLE reservas DROP FOREIGN KEY fk_reservas_usuarios;

