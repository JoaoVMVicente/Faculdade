DROP DATABASE IF EXISTS sistema_academico;
CREATE DATABASE sistema_academico;
USE sistema_academico;

DROP TABLE IF EXISTS alunos;
DROP TABLE IF EXISTS cursos;

CREATE TABLE cursos (
id_curso INT PRIMARY KEY,
nome_curso VARCHAR(200) NOT NULL,
duracao_semestres INT NOT NULL
);

CREATE TABLE alunos (
id_aluno INT PRIMARY KEY,
nome VARCHAR(200) NOT NULL,
data_nascimento DATE NOT NULL,
id_curso INT NULL,
FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

INSERT INTO cursos (id_curso, nome_curso, duracao_semestres) VALUES
(1, 'Análise e Desenvolvimento de Sistemas', 5),
(2, 'Ciência da Computação', 8),
(3, 'Engenharia de Software', 8),
(4, 'Sistemas de Informação', 8),
(5, 'Redes de Computadores', 5),
(6, 'Banco de Dados', 4),
(7, 'Inteligência Artificial', 6),
(8, 'Cibersegurança', 5),
(9, 'Gestão de TI', 4),
(10, 'Design Digital', 6);

INSERT INTO alunos (id_aluno, nome, data_nascimento, id_curso) VALUES
(1, 'Carlos Silva', '2001-03-15', 1),
(2, 'Mariana Souza', '2002-07-22', 1),
(3, 'Roberto Alves', '1999-11-05', 2),
(4, 'Fernanda Costa', '2003-01-30', 3),
(5, 'Lucas Pereira', '2000-09-12', 4),
(6, 'Beatriz Lima', '2002-04-18', 5),
(7, 'Gabriel Martins', '2001-08-25', NULL),
(8, 'Amanda Rocha', '2003-05-14', NULL),
(9, 'Diego Oliveira', '2000-12-01', NULL),
(10, 'Patricia Barbosa', '2002-10-08', NULL);

SELECT a.id_aluno, a.nome, c.nome_curso
FROM alunos a
INNER JOIN cursos c ON a.id_curso = c.id_curso;

SELECT a.id_aluno, a.nome, c.nome_curso
FROM alunos a
LEFT JOIN cursos c ON a.id_curso = c.id_curso;

SELECT a.id_aluno, a.nome, c.nome_curso
FROM alunos a
RIGHT JOIN cursos c ON a.id_curso = c.id_curso;

SELECT * FROM alunos
ORDER BY nome ASC;

SELECT * FROM cursos
ORDER BY duracao_semestres DESC;

SELECT COUNT(*) FROM alunos;

SELECT COUNT(*) FROM cursos;

SELECT c.nome_curso, COUNT(a.id_aluno) AS total_alunos
FROM cursos c
LEFT JOIN alunos a ON c.id_curso = a.id_curso
GROUP BY c.id_curso, c.nome_curso;

SELECT duracao_semestres, COUNT(*) AS quantidade_cursos
FROM cursos
GROUP BY duracao_semestres;