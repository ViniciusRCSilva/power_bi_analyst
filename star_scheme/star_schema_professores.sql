
-- Criação da Dimensão Professor
CREATE TABLE Dim_Professor (
    idProfessor INT PRIMARY KEY,
    Nome_Professor VARCHAR(100),
    Data_Admissao DATE,
    Titulacao VARCHAR(50)
);

-- Criação da Dimensão Departamento
CREATE TABLE Dim_Departamento (
    idDepartamento INT PRIMARY KEY,
    Nome_Departamento VARCHAR(100),
    Campus VARCHAR(100)
);

-- Criação da Dimensão Curso
CREATE TABLE Dim_Curso (
    idCurso INT PRIMARY KEY,
    Nome_Curso VARCHAR(100),
    Tipo_Curso VARCHAR(50)
);

-- Criação da Dimensão Disciplina
CREATE TABLE Dim_Disciplina (
    idDisciplina INT PRIMARY KEY,
    Nome_Disciplina VARCHAR(100),
    Carga_Horaria INT
);

-- Criação da Dimensão Data
CREATE TABLE Dim_Data (
    idData INT PRIMARY KEY,
    Data_Completa DATE,
    Ano INT,
    Semestre INT,
    Trimestre INT,
    Mes INT,
    Dia INT,
    Nome_Dia VARCHAR(15),
    Nome_Mes VARCHAR(15),
    E_Fim_De_Semana BOOLEAN,
    E_Feriado BOOLEAN
);

-- Criação da Tabela Fato: Fato_Professor
CREATE TABLE Fato_Professor (
    idFato INT PRIMARY KEY AUTO_INCREMENT,
    idProfessor INT,
    idDepartamento INT,
    idCurso INT,
    idDisciplina INT,
    idData_Semestre INT,
    Quantidade_Alunos INT,
    Quantidade_Cursos INT,
    Carga_Horaria_Total INT,
    FOREIGN KEY (idProfessor) REFERENCES Dim_Professor(idProfessor),
    FOREIGN KEY (idDepartamento) REFERENCES Dim_Departamento(idDepartamento),
    FOREIGN KEY (idCurso) REFERENCES Dim_Curso(idCurso),
    FOREIGN KEY (idDisciplina) REFERENCES Dim_Disciplina(idDisciplina),
    FOREIGN KEY (idData_Semestre) REFERENCES Dim_Data(idData)
);
