USE testequartafeira;

DROP TABLE IF EXISTS pedidos;

CREATE TABLE pedidos (
cod_pedido INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
cod_endereco INT NOT NULL,
data_pedido DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
valor_total DECIMAL(10, 2) NOT NULL,
status_pedido ENUM('Pendente', 'Em Processamento', 'Enviado', 'Entregue', 'Cancelado') NOT NULL DEFAULT 'Pendente',
forma_pagamento ENUM('Cartao Credito', 'Pix', 'Boleto', 'Transferencia') NOT NULL,
observacao VARCHAR(500),
CONSTRAINT fk_pedidos_enderecos
FOREIGN KEY (cod_endereco) REFERENCES enderecos(cod_endereco)
ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO pedidos (cod_endereco, data_pedido, valor_total, status_pedido, forma_pagamento, observacao) VALUES
(1,  '2026-08-01 10:15:00', 150.00,  'Entregue',        'Pix',            'Deixar na portaria'),
(1,  '2026-08-02 14:30:00', 89.90,   'Entregue',        'Cartao Credito', NULL),
(2,  '2026-08-03 09:00:00', 450.50,  'Entregue',        'Cartao Credito', 'Entregar após às 18h'),
(2,  '2026-08-05 11:20:00', 25.00,   'Cancelado',       'Boleto',         'Pagamento não efetuado'),
(3,  '2026-08-06 16:45:00', 1200.00, 'Entregue',        'Pix',            'Cliente preferencial'),
(3,  '2026-08-08 18:10:00', 75.30,   'Entregue',        'Cartao Credito', NULL),
(4,  '2026-08-10 08:05:00', 310.00,  'Enviado',         'Pix',            'Urgente'),
(4,  '2026-08-11 12:00:00', 50.00,   'Em Processamento','Boleto',         NULL),
(5,  '2026-08-12 13:15:00', 890.99,  'Enviado',         'Cartao Credito', 'Cuidado: produto frágil'),
(5,  '2026-08-13 15:30:00', 65.00,   'Entregue',        'Pix',            NULL),
(6,  '2026-08-14 17:00:00', 210.40,  'Pendente',        'Boleto',         'Aguardando compensação'),
(6,  '2026-08-15 19:25:00', 115.00,  'Entregue',        'Cartao Credito', NULL),
(7,  '2026-08-16 10:40:00', 540.00,  'Enviado',         'Pix',            'Embalagem para presente'),
(7,  '2026-08-17 11:55:00', 35.00,   'Cancelado',       'Cartao Credito', 'Solicitado pelo cliente'),
(8,  '2026-08-18 09:10:00', 999.00,  'Em Processamento','Transferencia',  NULL),
(8,  '2026-08-18 14:00:00', 180.00,  'Pendente',        'Pix',            NULL),
(9,  '2026-08-19 08:30:00', 420.00,  'Pendente',        'Cartao Credito', 'Confirmar dados por telefone'),
(9,  '2026-08-19 13:45:00', 60.00,   'Em Processamento','Pix',            NULL),
(10, '2026-08-19 16:20:00', 1350.50, 'Enviado',         'Transferencia',  'Nota fiscal em nome do CNPJ'),
(10, '2026-08-19 20:00:00', 95.00,   'Entregue',        'Pix',            NULL);

SELECT * FROM pedidos;

SELECT cod_pedido, valor_total, status_pedido FROM pedidos;

SELECT cod_pedido AS 'Código', valor_total AS 'Valor' FROM pedidos;

SELECT * FROM pedidos WHERE valor_total > 100.00;

SELECT * FROM pedidos WHERE status_pedido = 'Entregue';