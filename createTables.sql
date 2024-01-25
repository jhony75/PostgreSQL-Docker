CREATE TABLE Turmas (
  Id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  Nome TEXT NOT NULL,
  Codigo TEXT NOT NULL CHECK (LENGTH(Codigo) = 4),
  DataInicio DATE,
  DataFim DATE,
  Tamanho INT,
  Aproveitamento DECIMAL,
  CONSTRAINT turma_tamanho_check CHECK (Tamanho >= 3 AND Tamanho <= 8)
);

CREATE TABLE Alunos (
  Id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  Nome TEXT NOT NULL,
  DataNascimento DATE,
  CPF TEXT UNIQUE NOT NULL,
  Email TEXT UNIQUE NOT NULL,
  Aproveitamento DECIMAL
);

CREATE TABLE Professores (
  Id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  Nome TEXT NOT NULL,
  CPF TEXT UNIQUE NOT NULL,
  DataNascimento DATE,
  Email TEXT UNIQUE NOT NULL
);

CREATE TABLE Notas (
  Id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  Tipo TEXT NOT NULL,
  Unidade TEXT NOT NULL,
  Nota DECIMAL NOT NULL CHECK (Nota BETWEEN 0 AND 10),
  NotaComPeso DECIMAL
);

-- Adicionar relacionamentos de 1 para 1
-- Alterar tabela de Turmas para adicionar relacionamento com Professor
ALTER TABLE turmas ADD COLUMN professor_id UUID;
ALTER TABLE turmas ADD CONSTRAINT fk_turmas_professores
FOREIGN KEY (professor_id) REFERENCES professores(id);

-- Alterar tabela de Notas para adicionar relacionamento com Alunos
ALTER TABLE notas ADD COLUMN aluno_id UUID;
ALTER TABLE notas ADD CONSTRAINT fk_notas_alunos
FOREIGN KEY (aluno_id) REFERENCES alunos(id);

-- Adicionar relacionamento de muitos para muitos
-- Cria uma tabela de união de turmas e alunos, que impede que um aluno esteja duas vezes na mesma turma
CREATE TABLE alunos_turmas (
  aluno_id UUID,
  turma_id UUID,
  PRIMARY KEY (aluno_id, turma_id)
);
  
ALTER TABLE alunos_turmas
ADD CONSTRAINT fk_alunos_turmas_alunos FOREIGN KEY (aluno_id) REFERENCES alunos(id),
ADD CONSTRAINT fk_alunos_turmas_turmas FOREIGN KEY (turma_id) REFERENCES turmas(id);