CREATE TABLE Usuario (
    IdUsuario INT PRIMARY KEY IDENTITY,
    NombreUsuario VARCHAR(50) UNIQUE NOT NULL,
    Contraseña VARCHAR(255) NOT NULL
);

CREATE TABLE Clinica (
    IdClinica INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(255),
    Telefono VARCHAR(20)
);

CREATE TABLE Medicamento (
    IdMedicamento INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion TEXT
);

CREATE TABLE Enfermedad (
    IdEnfermedad INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion TEXT
);

CREATE TABLE Paciente (
    IdPaciente INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(100) NOT NULL,
    FechaNacimiento DATE,
    Direccion VARCHAR(255),
    Telefono VARCHAR(20)
);

CREATE TABLE Empleado (
    IdEmpleado INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(100) NOT NULL,
    Especialidad VARCHAR(100),
    Cargo VARCHAR(50),
    IdClinica INT,
    FOREIGN KEY (IdClinica) REFERENCES Clinica(IdClinica)
);

CREATE TABLE Cita (
    IdCita INT PRIMARY KEY IDENTITY,
    IdPaciente INT,
    FechaHora DATETIME NOT NULL,
    IdClinica INT,
    FOREIGN KEY (IdPaciente) REFERENCES Paciente(IdPaciente),
    FOREIGN KEY (IdClinica) REFERENCES Clinica(IdClinica)
);

CREATE TABLE Consulta (
    IdConsulta INT PRIMARY KEY IDENTITY,
    IdCita INT,
    IdEmpleado INT,
    Fecha DATE NOT NULL,
    Costo DECIMAL(10,2),
    FOREIGN KEY (IdCita) REFERENCES Cita(IdCita),
    FOREIGN KEY (IdEmpleado) REFERENCES Empleado(IdEmpleado)
);

CREATE TABLE DetalleConsulta (
    IdDetalleConsulta INT PRIMARY KEY IDENTITY,
    IdConsulta INT,
    IdEnfermedad INT,
    IdMedicamento INT,
    Diagnostico TEXT,
    FOREIGN KEY (IdConsulta) REFERENCES Consulta(IdConsulta),
    FOREIGN KEY (IdEnfermedad) REFERENCES Enfermedad(IdEnfermedad),
    FOREIGN KEY (IdMedicamento) REFERENCES Medicamento(IdMedicamento)
);
