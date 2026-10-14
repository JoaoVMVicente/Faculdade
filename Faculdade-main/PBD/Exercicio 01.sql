DROP DATABASE IF EXISTS testequartafeira;
CREATE DATABASE testequartafeira;

USE testequartafeira;

# Criação de Tabela - Primeiro lado 1 da cardinalidade
# Só tenho chaves primárias

DROP TABLE IF EXISTS enderecos; 
CREATE TABLE enderecos
( 
  cod_endereco int not null PRIMARY KEY,
  logradouro varchar(400) not null,
  numero int,
  complemento varchar(400),
  bairro varchar(400) not null,
  cidade varchar(400) not null,
  estado enum ('SP', 'RJ', 'MG', 'AL', 'RE', 'DF') 
);

# Primeiro lado 1 da minha cardinalidade 
INSERT INTO enderecos
(cod_endereco, logradouro, numero, complemento, bairro, cidade, estado)
VALUES
(1, 'Rua X', 36, 'ALA A', 'Socorro', 'SP', 'SP'),
(2, 'Rua Y', 23, 'Bloco 1', 'Socorro', 'SP', 'SP'),
(3, 'Rua C', 53, 'Bloco 2', 'Lapa', 'SP', 'SP'),
(4, 'Rua D', 64, 'Bloco 4', 'Morumbi', 'SP', 'SP'),
(5, 'Rua E', 55, '25 and', 'Paraiso', 'RJ', 'RJ'),
(6, 'Rua F', 49, null, 'Copacabana', 'RJ', 'RJ'),
(7, 'Rua G', 33, null, 'Leblon', 'RJ', 'RJ'),
(8, 'Rua H', 77, null, 'Pajuçara', 'AL', 'AL'),
(9, 'Rua I', 88, null, 'Ponta Verde', 'AL', 'AL'),
(10, 'Rua J', 897, null, 'Centro', 'MG', 'MG');

DROP TABLE IF EXISTS pedidos;
CREATE TABLE pedidos
(
	id_pedido int not null primary key,
    data_pedido date,
    status_pedido varchar(80),
    valor decimal(20,2),
    forma_pagamento varchar (80),
    endereco varchar (400),
    cod_endereco int null,
    FOREIGN KEY (cod_endereco)
    REFERENCES enderecos(cod_endereco)
);

INSERT INTO pedidos
(id_pedido, data_pedido, status_pedido, valor, forma_pagamento, endereco, cod_endereco)
VALUES
(1, '2026-02-11', 'Entregue', '100.00', 'Pix', 'Rua José Jardim da Silveira, 140 - Apartamento 101', '1'),
(2, '2022-11-30', 'Á caminho', '50.00', 'Pix', 'Rua José Jardim da Silveira, 140 - Apartamento 101', '2'),
(3, '2016-06-22', 'Em separação', '5.00', 'Pix', 'Rua José Jardim da Silveira, 140 - Apartamento 101', '3'),
(4, '2019-06-22', 'Entregue', '5000.00', 'Pix', 'Rua José Jardim da Silveira, 140 - Apartamento 101', '4'),
(5, '2021-07-19', 'Em separação', '1500.00', 'Pix', 'Rua José Jardim da Silveira, 140 - Apartamento 101', '5'),
(6, '2023-12-26', 'Em separação', '700.00', 'Pix', 'Rua José Jardim da Silveira, 140 - Apartamento 101', '6'),
(7, '2026-10-14', 'Entregue', '2000.00', 'Pix', 'Rua José Jardim da Silveira, 140 - Apartamento 101', '7'),
(8, '2026-03-26', 'Entregue', '580.00', 'Pix', 'Rua José Jardim da Silveira, 140 - Apartamento 101', '8'),
(9, '2020-05-31', 'Á caminho', '9000.00', 'Pix', 'Rua José Jardim da Silveira, 140 - Apartamento 101', '9'),
(10, '2026-01-01', 'Á caminho', '7300.00', 'Pix', 'Rua José Jardim da Silveira, 140 - Apartamento 101', '10');

SELECT * FROM enderecos;

SELECT * FROM pedidos;

SELECT * FROM pedidos
WHERE id_pedido = 8;

SELECT * FROM pedidos
WHERE valor > 200.0;

SELECT * FROM pedidos
WHERE valor > 1000.00
AND data_pedido < 2023;

