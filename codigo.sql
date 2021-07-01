--
-- creación de base de datos
--

CREATE DATABASE aerolinea_BD

--------------------------------------------------

--
-- creación tabla PASAJERO
--

CREATE TABLE Pasajero (
  dni VARCHAR(8) NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  f_nacimiento DATE NOT NULL,
  genero VARCHAR(50) NOT NULL,
  nacionalidad VARCHAR(50) NOT NULL,
  correo VARCHAR(50) NOT NULL,
  celular VARCHAR(9) NOT NULL,
  PRIMARY KEY(dni),
);

--
-- creación tabla PAÍS
--

CREATE TABLE Pais (
  cod_pais VARCHAR(3) NOT NULL,
  nombre_pais VARCHAR(50) NOT NULL, 
PRIMARY KEY(cod_pais),
);

--
-- creación tabla ESTADO
--

CREATE TABLE Estado (
  cod_estado VARCHAR(1) NOT NULL,
  nombre_estado VARCHAR(50) NOT NULL, 
PRIMARY KEY(cod_estado),
);

--
-- creación tabla TIPO VUELO
--

CREATE TABLE Tipo_vuelo (
  cod_tipo VARCHAR(2) NOT NULL,
  tipo VARCHAR(50) NOT NULL, 
PRIMARY KEY(cod_tipo),
);

--
-- creación tabla CLASE VUELO
--

CREATE TABLE Clase_vuelo (
  cod_clase VARCHAR(2) NOT NULL,
  clase VARCHAR(50) NOT NULL, 
PRIMARY KEY(cod_clase),
);


--
-- creación tabla AEROPUERTO
--

CREATE TABLE Aeropuerto(
  cod_aeropuerto VARCHAR(4) NOT NULL,
  nombre_aeropuerto VARCHAR(255) NOT NULL, 
cod_pais VARCHAR(3) NOT NULL,
PRIMARY KEY(cod_aeropuerto),
CONSTRAINT fk_pais FOREIGN KEY(cod_pais) REFERENCES Pais(cod_pais),
);

--
-- creación tabla AEROLINEA
--

CREATE TABLE Aerolinea(
  cod_aerolinea VARCHAR(3) NOT NULL,
  nombre_aerolinea VARCHAR(255) NOT NULL, 
aeropuerto_principal VARCHAR(4) NOT NULL,
PRIMARY KEY(cod_aerolinea),
CONSTRAINT fk_aeropuerto FOREIGN KEY(aeropuerto_principal) REFERENCES Aeropuerto(cod_aeropuerto),
);

--
-- creación tabla AVIONES
--

CREATE TABLE Aviones(
  cod_avion VARCHAR(4) NOT NULL,
  modelo_avion VARCHAR(50) NOT NULL, 
cod_aerolinea VARCHAR(3) NOT NULL,
capacidad INT NOT NULL,
PRIMARY KEY(cod_avion),
CONSTRAINT fk_aerolinea FOREIGN KEY(cod_aerolinea) REFERENCES Aerolinea(cod_aerolinea),
);

--
-- creación tabla VUELOS
--

CREATE TABLE Vuelos(
  cod_vuelo VARCHAR(4) NOT NULL,
  cod_avion VARCHAR(4) NOT NULL,
pais_origen VARCHAR(3) NOT NULL, 
pais_destino VARCHAR(3) NOT NULL,
hora_salida DATETIME NOT NULL,
hora_llegada DATETIME NOT NULL, 
PRIMARY KEY(cod_vuelo),
CONSTRAINT fk_avion FOREIGN KEY(cod_avion) REFERENCES Aviones(cod_avion),
CONSTRAINT fk_paisO FOREIGN KEY(pais_origen) REFERENCES Pais(cod_pais),
CONSTRAINT fk_paisD FOREIGN KEY(pais_destino) REFERENCES Pais(cod_pais),
);

--
-- creación tabla SALIDAS
--

CREATE TABLE Salidas(
  cod_aerolinea VARCHAR(3) NOT NULL,
  cod_vuelo VARCHAR(4) NOT NULL,
destino VARCHAR(3) NOT NULL, 
tiempo TIME NOT NULL,
cod_estado VARCHAR(1) NOT NULL,
puerta_abordaje VARCHAR(3) NOT NULL,
CONSTRAINT fk_aerolinea FOREIGN KEY(cod_aerolinea) REFERENCES Aerolinea(cod_aerolinea),
CONSTRAINT fk_vuelo FOREIGN KEY(cod_vuelo) REFERENCES Vuelos(cod_vuelo),
CONSTRAINT fk_destino FOREIGN KEY(destino) REFERENCES Pais(cod_pais),
CONSTRAINT fk_estado FOREIGN KEY(cod_estado) REFERENCES Estado(cod_estado),
);

--
-- creación tabla RESERVACION
--

CREATE TABLE Reservacion(
  cod_reservacion VARCHAR(6) NOT NULL, 
  cod_aerolinea VARCHAR(3) NOT NULL,
  cod_tipo VARCHAR(2) NOT NULL,
cod_clase VARCHAR(2) NOT NULL, 
cod_vuelo VARCHAR(4) NOT NULL,
asiento VARCHAR(2) NOT NULL,
fila VARCHAR(2) NOT NULL,
PRIMARY KEY(cod_reservacion), 
CONSTRAINT fk_aerolinea FOREIGN KEY(cod_aerolinea) REFERENCES Aerolinea(cod_aerolinea),
CONSTRAINT fk_tipo FOREIGN KEY(cod_tipo) REFERENCES Tipo_vuelo(cod_tipo),
CONSTRAINT fk_clase FOREIGN KEY(cod_clase) REFERENCES Clase_vuelo(cod_clase),
CONSTRAINT fk_vuelo FOREIGN KEY(cod_vuelo) REFERENCES Vuelos(cod_vuelo),
) ;

--
-- creación tabla PASE DE ABORDAR
--

CREATE TABLE Pase_abordar(
  cod_pase VARCHAR(5) NOT NULL, 
  dni VARCHAR(8) NOT NULL,
  cod_reservacion VARCHAR(6) NOT NULL,
aeropuerto_origen VARCHAR(4) NOT NULL, 
aeropuerto_destino VARCHAR(4) NOT NULL,
PRIMARY KEY(cod_pase),
CONSTRAINT fk_dni FOREIGN KEY(dni) REFERENCES Pasajero(dni),
CONSTRAINT fk_reservacion FOREIGN KEY(cod_reservacion) REFERENCES Reservacion(cod_reservacion),
CONSTRAINT fk_aeropuertoO FOREIGN KEY(aeropuerto_origen) REFERENCES Aeropuerto(cod_aeropuerto),
CONSTRAINT fk_aeropuertoD FOREIGN KEY(aeropuerto_destino) REFERENCES Aeropuerto(cod_aeropuerto),
);
