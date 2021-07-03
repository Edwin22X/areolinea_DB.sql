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

---Inserción de datos Pasajero
---
---MES-DIA-AÑO formato de la fecha
INSERT INTO Pasajero VALUES (12564897,'Luis','Guevara','06-01-1985','masculino','peruano','luis@gmail.com',959152468),
(15849290,'Angie','Jimenes','07-18-1998','femenino','venezolana','angie@gmail.com',949268489),
(18364790,'Zumba','Huamaní','01-23-1990','masculino','mexicano','zumba@gmail.com',916374689),
(12917367,'Geraldine','Salcedo','10-20-1993','femenino','chilena' ,'geraldine@gmail.com',910237890),
(17281907,'Celeste','Pardo','12-11-1999','femenino','ecuatoriana','celeste@gmail.com',912647579),
(12737268,'Ariana','Quevedo','12-12-1998','femenino','peruana','ariana@gmail.com',912378648),
(11825488,'Gustavo','Mallqui','05-13-1989','masculino','peruano','gustavo@gmail.com',990736899),
(19472579,'German','Garmendia','08-12-1990','masculino','chileno','german@gmail.com',993715167),
(18361789,'Adriana','Sanchez','06-13-1976','femenino','argentina','adriana@gmail.com',912389756),
(18366808,'Alejandro','Avondano','03-12-1999','masculino','brasileño','alejandro@gmail.com',916372467),
(15728874,'Camilo','Cortés','11-11-1991','masculino','peruano','camilo@gmail.com',916371237),
(18480752,'Diana','Lopez','10-07-1967','femenino','peruana','diana@gmail.com',995651707),
(17469076,'Gabriel','Nieto','03-23-1999','masculino','cubano','gabriel@gmail.com',974071568),
(18379076,'Deny','Muñoz','05-23-1998','femenino','peruana','deny@gmail.com',900086156),
(18451808,'Cristina','Barthel','09-08-2000','femenino','boliviana','cristina@gmail.com',911186897),
(12456235,'Lucia','Carrillo','05-05-1999','femenino','venezolana','lucia@gmail.com',963258741);


--
-- creación tabla PAÍS
--

CREATE TABLE Pais (
  cod_pais VARCHAR(3) NOT NULL,
  nombre_pais VARCHAR(50) NOT NULL, 
PRIMARY KEY(cod_pais),
);


--Inserción de datos Pais
--

INSERT INTO Pais VALUES
('BRA','Brasil'),
('BOL','Bolivia'),
('CHL','Chile'),
('COL','Colombia'),
('CRI','Costa Rica'),
('ECU','Ecuador'),
('GTM','Guatemala'),
('ITA','Italia'),
('MEX','Mexico'),
('NIC','Nicaragua'),
('PAN','Panamá'),
('URY','Uruguay'),
('USA','Estado Unidos'),
('ESP','España'),
('PER','Perú'),
('DEU','Alemania'),
('VEN','Venezuela');


--
-- creación tabla ESTADO
--

CREATE TABLE Estado (
  cod_estado VARCHAR(1) NOT NULL,
  nombre_estado VARCHAR(50) NOT NULL, 
PRIMARY KEY(cod_estado),
);


--Inserción de datos Estado
--

INSERT INTO Estado VALUES 
('C','Cancelled'), 
('D','Delayed'), 
('O','On Time');


--
-- creación tabla TIPO VUELO
--

CREATE TABLE Tipo_vuelo (
  cod_tipo VARCHAR(2) NOT NULL,
  tipo VARCHAR(50) NOT NULL, 
PRIMARY KEY(cod_tipo),
);


--Inserción datos Tipo_vuelo
--

INSERT INTO Tipo_vuelo VALUES
('SI','Solo Ida'),
('IV','Ida y Vuelta');


--
-- creación tabla CLASE VUELO
--

CREATE TABLE Clase_vuelo (
  cod_clase VARCHAR(2) NOT NULL,
  clase VARCHAR(50) NOT NULL, 
PRIMARY KEY(cod_clase),
);


--Inserción datos Clase_vuelo
--

INSERT INTO Clase_vuelo VALUES
('FC','First Class'),
('BC','Business Class'),
('TC','Tourist Class');


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


--Inserción de datos Aeropuerto
--

INSERT INTO Aeropuerto VALUES
('AANF','Aeropuerto Cerro Moreno','CHL'),
('ABCN','Aeropuerto de Barcelona-El Prat','ESP'),
('ABOG','Aeropuerto Internacional El Dorado','COL'),
('AGRU','Aeropuerto Internacional de São Paulo-Guarulhos','BRA'),
('AVVI','Aeropuerto Internacional Viru Viru','BOL'),
('ASJO','Aeropuerto Internacional Juan Santamaría','CRI'),
('AMEC','Aeropuerto de Manta','ECU'),
('APBR','Aeropuerto de Puerto Barrios','GTM'),
('ANAP','Aeropuerto de Nápoles-Capodichino','ITA'),
('AGDL','Aeropuerto Internacional de Guadalajara','MEX'),
('AMGA','Aeropuerto Internacional Augusto C. Sandino','NIC'),
('APTY','Aeropuerto Internacional de Tocumen','PAN'),
('AMVD','Aeropuerto Internacional de Carrasco','URY'),
('ALAX','Aeropuerto Internacional de Los Ángeles','USA'),
('ALIM','Aeropuerto Internacional Jorge Chávez','PER'),
('AHAM','Aeropuerto de Hamburgo','DEU'),
('ACCS','Aeropuerto Internacional de Maiquetía Simón Bolívar','VEN');


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

--Inserción datos Aerolinea
--

INSERT INTO Aerolinea VALUES
('AAU','American Airlines','ALAX'),
('APR','Avianca','ALIM'),
('IES','Interjet','ABCN'),
('SAD','Sky Airline','AHAM'),
('BAB','Boliviana de Aviacion','AVVI'),
('VCC','VivaColombia','ABOG'),
('SCR','Star','ASJO'),
('QAC','Qatar Airways','AANF'),
('AIT','Alitalia','ANAP'),
('JBG','JetBlue','APBR'),
('LAB','LATAM Airlines Brasil','AGRU'),
('AFU','Aeroflot','AMVD'),
('AEV','Air Europa','ACCS'),
('SAE','Spirit Airlines','AMEC'),
('AMX','Aeromexico','AGDL'),
('KNI','KLM','AMGA'),
('XAP','Xiamen Airlines','APTY');


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

--Inserción de datos Aviones
--

INSERT INTO Aviones VALUES
('A32X','Airbus A330-200','XAP',264),
('A77K','Boeing 737-700','KNI',128),
('B78A','Boeing 737-800','AMX',170),
('B7MS','Boeing 737 MAX','SAE',170),
('E1AE','Embraer 190','AEV',96),
('AA8A','Airbus A380-800','AFU',153),
('AA6L','Airbus A340-600','LAB',280),
('B73J','Boeing 777-300','JBG',150),
('B74A','Boeing 747-400','AIT',126),
('B7IQ','Boeing 747-8 Intercontinental','QAC',267),
('M23S','MS-21-300','SCR',211),
('C9VC','C919','VCC',150),
('ABX8','Airbus Beluga XL','BAB',159),
('AA3S','Airbus A319','SAD',163),
('A32I','Airbus 330-200','IES',100),
('B7MA','Boeing 737 MAX 8','APR',189),
('B78U','Boeing 780 - 800','AAU',160);

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


--Inserción datos Vuelos
--

INSERT INTO Vuelos VALUES
('AAAA','AAAA','AAA','AAA','2021-99-99 99:99:00','2021-99-99 99:99:00');
('AAAA','AAAA','AAA','AAA','2021-99-99 99:99:00','2021-99-99 99:99:00');
('AAAA','AAAA','AAA','AAA','2021-99-99 99:99:00','2021-99-99 99:99:00');
('AAAA','AAAA','AAA','AAA','2021-99-99 99:99:00','2021-99-99 99:99:00');
('AAAA','AAAA','AAA','AAA','2021-99-99 99:99:00','2021-99-99 99:99:00');
('AAAA','AAAA','AAA','AAA','2021-99-99 99:99:00','2021-99-99 99:99:00');
('AAAA','AAAA','AAA','AAA','2021-99-99 99:99:00','2021-99-99 99:99:00');
('AAAA','AAAA','AAA','AAA','2021-99-99 99:99:00','2021-99-99 99:99:00');
('AAAA','AAAA','AAA','AAA','2021-99-99 99:99:00','2021-99-99 99:99:00');
('AAAA','AAAA','AAA','AAA','2021-99-99 99:99:00','2021-99-99 99:99:00');
('AAAA','AAAA','AAA','AAA','2021-99-99 99:99:00','2021-99-99 99:99:00');
('AAAA','AAAA','AAA','AAA','2021-99-99 99:99:00','2021-99-99 99:99:00');
('AAAA','AAAA','AAA','AAA','2021-99-99 99:99:00','2021-99-99 99:99:00');
('AAAA','AAAA','AAA','AAA','2021-99-99 99:99:00','2021-99-99 99:99:00');
('AAAA','AAAA','AAA','AAA','2021-99-99 99:99:00','2021-99-99 99:99:00');
('AAAA','AAAA','AAA','AAA','2021-99-99 99:99:00','2021-99-99 99:99:00');
('AAAA','AAAA','AAA','AAA','2021-99-99 99:99:00','2021-99-99 99:99:00');

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
CONSTRAINT fk_aerolineaS FOREIGN KEY(cod_aerolinea) REFERENCES Aerolinea(cod_aerolinea),
CONSTRAINT fk_vueloS FOREIGN KEY(cod_vuelo) REFERENCES Vuelos(cod_vuelo),
CONSTRAINT fk_destinoS FOREIGN KEY(destino) REFERENCES Pais(cod_pais),
CONSTRAINT fk_estadoS FOREIGN KEY(cod_estado) REFERENCES Estado(cod_estado),
);

--Insercion de datos Salidad
--

INSERT INTO Salidas VALUES
('AAA','AAAA','AAA','99-99-99','A','AAA'),
('AAA','AAAA','AAA','99-99-99','A','AAA'),
('AAA','AAAA','AAA','99-99-99','A','AAA'),
('AAA','AAAA','AAA','99-99-99','A','AAA'),
('AAA','AAAA','AAA','99-99-99','A','AAA'),
('AAA','AAAA','AAA','99-99-99','A','AAA'),
('AAA','AAAA','AAA','99-99-99','A','AAA'),
('AAA','AAAA','AAA','99-99-99','A','AAA'),
('AAA','AAAA','AAA','99-99-99','A','AAA'),
('AAA','AAAA','AAA','99-99-99','A','AAA'),
('AAA','AAAA','AAA','99-99-99','A','AAA'),
('AAA','AAAA','AAA','99-99-99','A','AAA'),
('AAA','AAAA','AAA','99-99-99','A','AAA'),
('AAA','AAAA','AAA','99-99-99','A','AAA'),
('AAA','AAAA','AAA','99-99-99','A','AAA'),
('AAA','AAAA','AAA','99-99-99','A','AAA'),
('AAA','AAAA','AAA','99-99-99','A','AAA'),

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
CONSTRAINT fk_aerolineaR FOREIGN KEY(cod_aerolinea) REFERENCES Aerolinea(cod_aerolinea),
CONSTRAINT fk_tipoR FOREIGN KEY(cod_tipo) REFERENCES Tipo_vuelo(cod_tipo),
CONSTRAINT fk_claseR FOREIGN KEY(cod_clase) REFERENCES Clase_vuelo(cod_clase),
CONSTRAINT fk_vueloR FOREIGN KEY(cod_vuelo) REFERENCES Vuelos(cod_vuelo),
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
CONSTRAINT fk_dniPA FOREIGN KEY(dni) REFERENCES Pasajero(dni),
CONSTRAINT fk_reservacionPA FOREIGN KEY(cod_reservacion) REFERENCES Reservacion(cod_reservacion),
CONSTRAINT fk_aeropuertoOPA FOREIGN KEY(aeropuerto_origen) REFERENCES Aeropuerto(cod_aeropuerto),
CONSTRAINT fk_aeropuertoDPA FOREIGN KEY(aeropuerto_destino) REFERENCES Aeropuerto(cod_aeropuerto),
);
