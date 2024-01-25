-- Populate the database with sample data

-- Generate 5 Professores using DEFAULT nextval for primary key
INSERT INTO Professores (Nome, CPF, DataNascimento, Email)
SELECT md5(random()::text),  -- Generate random names for simplicity
       md5(random()::text),
       current_date - (random() * 30 * interval '1 year'),
       md5(random()::text) || '@example.com'
FROM generate_series(1, 5);

-- Generate Turmas with Professores, ensuring each Professor has at most 3 Turmas
INSERT INTO Turmas (ProfessorId, Nome, Código, DataInicio, DataFim, Tamanho)
SELECT p.Id,
       md5(random()::text),
       lpad(ceil(random() * 9999)::text, 4, '0'),
       current_date - (random() * 30 * interval '1 day'),
       current_date + (random() * 45 * interval '1 day'),
       ceil(random() * 6 + 3)
FROM Professores p
CROSS JOIN generate_series(1, 3) g
ORDER BY random();

-- Generate 50 Alunos, randomly assigning them to Turmas with appropriate size constraints
INSERT INTO Alunos (Nome, DataNascimento, CPF, Email, TurmaId)
SELECT md5(random()::text),
       current_date - (random() * 30 * interval '1 year'),
       md5(random()::text),
       md5(random()::text) || '@example.com',
       (SELECT t.Id FROM Turmas t WHERE Tamanho < 8 ORDER BY random() LIMIT 1)
FROM generate_series(1, 50);

-- Update Turmas' Tamanho based on Aluno count
UPDATE Turmas t
SET Tamanho = (SELECT COUNT(*) FROM Alunos a WHERE a.TurmaId = t.Id);

-- Generate 10 Notas for each Aluno
INSERT INTO Notas (AlunoId, Tipo, Unidade, Nota, NotaComPeso)
SELECT a.Id,
       md5(random()::text),
       md5(random()::text),
       random() * 10,
       (random() * 10) * 0.1
FROM Alunos a
CROSS JOIN generate_series(1, 10) g;

-- Update Alunos' and Turmas' Aproveitamento
UPDATE Alunos a
SET Aproveitamento = (SELECT SUM(n.NotaComPeso) FROM Notas n WHERE n.AlunoId = a.Id);

UPDATE Turmas t
SET Aproveitamento