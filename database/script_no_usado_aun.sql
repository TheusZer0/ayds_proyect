-- MySQL Workbench Forward Engineering
-- -----------------------------------------------------
    -- Schema mydb
-- -----------------------------------------------------
    -- -----------------------------------------------------
        -- Schema mydb
-- -----------------------------------------------------
    CREATE SCHEMA mydb;

-- -----------------------------------------------------
    -- Table mydb.Usuario
-- -----------------------------------------------------

    CREATE TABLE mydb.Usuario (
    UsuarioID INT NOT NULL,
    Nombre VARCHAR(45) NOT NULL,
    Apellido VARCHAR(45) NOT NULL,
    edad INT NULL,
    PRIMARY KEY (UsuarioID)
);


-- -----------------------------------------------------
    -- Table mydb.Curso
-- -----------------------------------------------------

    CREATE TABLE mydb.Curso (
    CursoID INT NOT NULL,
    Nombre_curso VARCHAR(45) NOT NULL,
    Profesor_jefeID VARCHAR(45) NOT NULL,
    PRIMARY KEY (CursoID)
);


-- -----------------------------------------------------
    -- Table mydb.Apoderado
-- -----------------------------------------------------

    CREATE TABLE mydb.Apoderado (
    UsuarioID INT NOT NULL,
    PRIMARY KEY (UsuarioID),
    INDEX fk_Apoderado_Usuario1_idx (UsuarioID),
    CONSTRAINT fk_Apoderado_Usuario1
FOREIGN KEY (UsuarioID)
REFERENCES mydb.Usuario (UsuarioID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);


-- -----------------------------------------------------
    -- Table mydb.Alumno
-- -----------------------------------------------------
    DROP TABLE IF EXISTS mydb.Alumno ;

CREATE TABLE IF NOT EXISTS mydb.Alumno (
    UsuarioID INT NOT NULL,
    CursoID INT NOT NULL,
    ApoderadoID INT NOT NULL,
    PRIMARY KEY (UsuarioID),
    INDEX fk_Alumno_Usuario1_idx (UsuarioID),
    INDEX fk_Alumno_Curso1_idx (CursoID ),
    INDEX fk_Alumno_Apoderado1_idx (ApoderadoID),
    CONSTRAINT fk_Alumno_Usuario1
FOREIGN KEY (UsuarioID)
REFERENCES mydb.Usuario (UsuarioID)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
    CONSTRAINT fk_Alumno_Curso1
FOREIGN KEY (CursoID)
REFERENCES mydb.Curso (CursoID)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
    CONSTRAINT fk_Alumno_Apoderado1
FOREIGN KEY (ApoderadoID)
REFERENCES mydb.Apoderado (UsuarioID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);


-- -----------------------------------------------------
    -- Table mydb.Asignatura
-- -----------------------------------------------------
    DROP TABLE IF EXISTS mydb.Asignatura ;

CREATE TABLE IF NOT EXISTS mydb.Asignatura (
    AsignaturaID INT NOT NULL,
    Nombre_asignatura VARCHAR(45) NULL,
    PRIMARY KEY (AsignaturaID)
);


-- -----------------------------------------------------
    -- Table mydb.Profesor
-- -----------------------------------------------------
    DROP TABLE IF EXISTS mydb.Profesor ;

CREATE TABLE IF NOT EXISTS mydb.Profesor (
    Usuario_UsuarioID INT NOT NULL,
    AsignaturaID INT NOT NULL,
    PRIMARY KEY (Usuario_UsuarioID),
    INDEX fk_Profesor_Usuario1_idx (Usuario_UsuarioID),
    INDEX fk_Profesor_Asignatura1_idx (AsignaturaID),
    CONSTRAINT fk_Profesor_Usuario1
FOREIGN KEY (Usuario_UsuarioID)
REFERENCES mydb.Usuario (UsuarioID)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
    CONSTRAINT fk_Profesor_Asignatura1
FOREIGN KEY (AsignaturaID)
REFERENCES mydb.Asignatura (AsignaturaID)
ON DELETE NO ACTION
ON UPDATE NO ACTION);


-- -----------------------------------------------------
    -- Table mydb.Correo
-- -----------------------------------------------------
    DROP TABLE IF EXISTS mydb.Correo ;

CREATE TABLE IF NOT EXISTS mydb.Correo (
    MensajeID INT NOT NULL,
    Emisor VARCHAR(45) NULL,
    Receptor VARCHAR(45) NULL,
    Contenido VARCHAR(45) NULL,
    PRIMARY KEY (MensajeID));


-- -----------------------------------------------------
    -- Table mydb.Jefe UTP
-- -----------------------------------------------------
    DROP TABLE IF EXISTS mydb.Jefe_UTP ;

CREATE TABLE IF NOT EXISTS mydb.Jefe_UTP (
    Usuario_UsuarioID INT NOT NULL,
    PRIMARY KEY (Usuario_UsuarioID),
    CONSTRAINT fk_Jefe_UTP_Usuario1
FOREIGN KEY (Usuario_UsuarioID)
REFERENCES mydb.Usuario (UsuarioID)
ON DELETE NO ACTION
ON UPDATE NO ACTION);


-- -----------------------------------------------------
    -- Table mydb.Director
-- -----------------------------------------------------
    DROP TABLE IF EXISTS mydb.Director ;

CREATE TABLE IF NOT EXISTS mydb.Director (
    UsuarioID INT NOT NULL,
    INDEX fk_Director_Usuario1_idx (UsuarioID),
    PRIMARY KEY (UsuarioID),
    CONSTRAINT fk_Director_Usuario1
FOREIGN KEY (UsuarioID)
REFERENCES mydb.Usuario (UsuarioID)
ON DELETE NO ACTION
ON UPDATE NO ACTION);


-- -----------------------------------------------------
    -- Table mydb.Profesor jefe
-- -----------------------------------------------------
    DROP TABLE IF EXISTS mydb.Profesor_jefe ;

CREATE TABLE IF NOT EXISTS mydb.Profesor_jefe (
    UsuarioID INT NOT NULL,
    CursoID INT NOT NULL,
    INDEX fk_Profesor_jefe_Usuario1_idx (UsuarioID),
    PRIMARY KEY (UsuarioID),
    INDEX fk_Profesor_jefe_Curso1_idx (CursoID),
    CONSTRAINT fk_Profesor_jefe_Usuario1
FOREIGN KEY (UsuarioID)
REFERENCES mydb.Usuario (UsuarioID)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
    CONSTRAINT fk_Profesor_jefe_Curso1
FOREIGN KEY (CursoID)
REFERENCES mydb.Curso (CursoID)
ON DELETE NO ACTION
ON UPDATE NO ACTION);


-- -----------------------------------------------------
    -- Table mydb.Usuario_has_Correo
-- -----------------------------------------------------
    DROP TABLE IF EXISTS mydb.Usuario_has_Correo ;

CREATE TABLE IF NOT EXISTS mydb.Usuario_has_Correo (
    Usuario_UsuarioID INT NOT NULL,
    Correo_MensajeID INT NOT NULL,
    PRIMARY KEY (Usuario_UsuarioID, Correo_MensajeID),
    INDEX fk_Usuario_has_Correo_Correo1_idx (Correo_MensajeID),
    INDEX fk_Usuario_has_Correo_Usuario1_idx (Usuario_UsuarioID),
    CONSTRAINT fk_Usuario_has_Correo_Usuario1
FOREIGN KEY (Usuario_UsuarioID)
REFERENCES mydb.Usuario (UsuarioID)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
    CONSTRAINT fk_Usuario_has_Correo_Correo1
FOREIGN KEY (Correo_MensajeID)
REFERENCES mydb.Correo (MensajeID)
ON DELETE NO ACTION
ON UPDATE NO ACTION);


-- -----------------------------------------------------
    -- Table mydb.Curso_has_Asignatura
-- -----------------------------------------------------
    DROP TABLE IF EXISTS mydb.Curso_has_Asignatura ;

CREATE TABLE IF NOT EXISTS mydb.Curso_has_Asignatura (
    Curso_CursoID INT NOT NULL,
    Asignatura_AsignaturaID INT NOT NULL,
    PRIMARY KEY (Curso_CursoID, Asignatura_AsignaturaID),
    INDEX fk_Curso_has_Asignatura_Asignatura1_idx (Asignatura_AsignaturaID),
    INDEX fk_Curso_has_Asignatura_Curso1_idx (Curso_CursoID),
    CONSTRAINT fk_Curso_has_Asignatura_Curso1
FOREIGN KEY (Curso_CursoID)
REFERENCES mydb.Curso (CursoID)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
    CONSTRAINT fk_Curso_has_Asignatura_Asignatura1
FOREIGN KEY (Asignatura_AsignaturaID)
REFERENCES mydb.Asignatura (AsignaturaID)
ON DELETE NO ACTION
ON UPDATE NO ACTION)

INSERT INTO mydb.usuario (UsuarioID, Nombre, Apellido, edad) VALUES ('1', 'Robert', 'Parra', '16');
INSERT INTO mydb.usuario (UsuarioID, Nombre, Apellido, edad) VALUES ('2', 'Joaquin', 'Aguilera', '17');
INSERT INTO mydb.apoderado (UsuarioID) VALUES ('1');
INSERT INTO mydb.curso (CursoID, Nombre curso, Profesor_jefeID) VALUES ('32', '2b', '1');
INSERT INTO mydb.alumno (UsuarioID, CursoID, ApoderadoID) VALUES ('1', '32', '1');
INSERT INTO mydb.asignatura (AsignaturaID, Nombre_asignatura) VALUES ('300', 'Historia');
INSERT INTO mydb.profesor (Usuario_UsuarioID, AsignaturaID) VALUES ('1', '300');
