-- Insere um professor
INSERT INTO professores (nome, cpf, datanascimento, email)
VALUES ('João da Silva', '123.456.789-00', '1980-01-01', 'joao.da.silva@email.com');

-- Insere uma turma
INSERT INTO turmas (nome, codigo, datainicio, datafim, tamanho)
VALUES
('Básico', '0001', '2024-02-01', '2024-07-01', 3),
('Intermediário', '0002', '2024-02-01','','2024-07-01', 3);

-- Insere alulnos
INSERT INTO alunos (nome, datanascimento, cpf, email)
VALUES
('Maria da Silva', '1990-02-03', '987.654.321-00', 'maria.da.silva@email.com'),
('Pedro da Silva', '1992-04-05', '234.567.890-12', 'pedro.da.silva@email.com'),
('Ana da Silva', '1994-06-07', '345.678.901-23', 'ana.da.silva@email.com'),
('João Pedro', '2002-01-01', '000.000.000-01', 'joao.pedro@email.com'),
('Maria Clara', '2003-02-02', '000.000.000-02', 'maria.clara@email.com'),
('José Carlos', '2004-03-03', '000.000.000-03', 'jose.carlos@email.com');

-- Insere notas
INSERT INTO notas (tipo, unidade, nota, aluno_id)
VALUES
('Prova', 'Intermediária', 8, (SELECT id FROM alunos WHERE nome = 'Maria da Silva')),
('Prova', 'Intermediária', 7, (SELECT id FROM alunos WHERE nome = 'Pedro da Silva')),
('Prova', 'Intermediária', 9, (SELECT id FROM alunos WHERE nome = 'Ana da Silva'));
('Prova', 'Intermediária', 5, (SELECT id FROM alunos WHERE nome = 'João Pedro')),
('Prova', 'Intermediária', 10, (SELECT id FROM alunos WHERE nome = 'Maria Clara')),
('Prova', 'Intermediária', 6, (SELECT id FROM alunos WHERE nome = 'José Carlos'));

-- Insere alunos em turmas
INSERT INTO alunos_turmas (aluno_id, turma_id)
VALUES
((SELECT Id FROM alunos WHERE nome = 'Maria da Silva'), (SELECT Id FROM turmas WHERE nome = 'Básico')),
((SELECT Id FROM alunos WHERE nome = 'Pedro da Silva'), (SELECT Id FROM turmas WHERE nome = 'Básico')),
((SELECT Id FROM alunos WHERE nome = 'Ana da Silva'), (SELECT Id FROM turmas WHERE nome = 'Básico')),
((SELECT Id FROM alunos WHERE nome = 'João Pedro'), (SELECT Id FROM turmas WHERE nome = 'Intermediário')),
((SELECT Id FROM alunos WHERE nome = 'Maria Clara'), (SELECT Id FROM turmas WHERE nome = 'Intermediário')),
((SELECT Id FROM alunos WHERE nome = 'José Carlos'), (SELECT Id FROM turmas WHERE nome = 'Intermediário')),