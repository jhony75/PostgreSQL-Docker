-- Create the tables with default SERIAL primary keys and relationships
CREATE TABLE Turmas (
  Id SERIAL PRIMARY KEY,
  ProfessorId INTEGER REFERENCES Professores(Id),
  Nome TEXT NOT NULL,
  Código TEXT NOT NULL CHECK (LENGTH(Código) = 4),
  DataInicio DATE,
  DataFim DATE,
  Tamanho INT,
  Aproveitamento DECIMAL,
  CONSTRAINT turma_tamanho_check CHECK (Tamanho >= 3 AND Tamanho <= 8)
);

CREATE TABLE Alunos (
  Id SERIAL PRIMARY KEY,
  Nome TEXT NOT NULL,
  DataNascimento DATE,
  CPF TEXT UNIQUE NOT NULL,
  Email TEXT UNIQUE NOT NULL,
  TurmaId INTEGER REFERENCES Turmas(Id),
  Aproveitamento DECIMAL
);

CREATE TABLE Professores (
  Id SERIAL PRIMARY KEY,
  Nome TEXT NOT NULL,
  CPF TEXT UNIQUE NOT NULL,
  DataNascimento DATE,
  Email TEXT UNIQUE NOT NULL
);

CREATE TABLE Notas (
  Id SERIAL PRIMARY KEY,
  AlunoId INTEGER REFERENCES Alunos(Id),
  Tipo TEXT NOT NULL,
  Unidade TEXT NOT NULL,
  Nota DECIMAL NOT NULL CHECK (Nota BETWEEN 0 AND 10),
  NotaComPeso DECIMAL
);
