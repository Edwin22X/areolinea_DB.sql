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
('DEU','Alemania'),
('BOL','Bolivia'),
('BRA','Brasil'),
('CHL','Chile'),
('COL','Colombia'),
('CRI','Costa Rica'),
('ECU','Ecuador'),
('ESP','España'),
('USA','Estados Unidos'),
('GTM','Guatemala'),
('ITA','Italia'),
('MEX','Mexico'),
('NIC','Nicaragua'),
('PAN','Panamá'),
('PER','Perú'),
('URY','Uruguay'),
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
('BUD7','B78U','USA','DUE','2021-07-10 12:00:00','2021-07-10 20:44:00'), --Estados Unidos a  Alemania // 8h 44min
('BPB7','B7MA','PER','BOL','2021-07-13 15:30:00','2021-07-14 06:07:00'), --Peru a Bolivia // 14h 37min
('AEC8','A32I','ESP','COL','2021-08-05 16:00:00','2021-08-06 09:00:00'), --España a Colombia // 17h
('ADC8','AA3S','DEU','CHL','2021-08-12 15:00:00','2021-08-13 08:15:00'), --Alemania a Chile // 17h 15min
('ABC9','ABX8','BOL','CRI','2021-09-10 16:00:00','2021-09-11 20:05:00'), --Bolivia a  Costa Rica // 28h 05min
('CCE9','C9VC','COL','ECU','2021-09-08 18:00:00','2021-09-08 22:16:00'), --Colombia a Ecuador // 4h 16min
('MCG7','M23S','CRI','GTM','2021-07-16 09:30:00','2021-07-16 11:30:00'), --Costa Rica a Guatemala// 2h
('BCB8','B7IQ','CHL','BRA','2021-08-05 11:30:00','2021-08-05 15:35:00'), --Chile a Brasil // 4h 5min
('BIP7','B74A','ITA','PER','2021-07-18 13:00:00','2021-07-19 06:20:00'), --Italia a Peru // 17h 20min
('BGU0','B73J','GTM','URY','2021-10-12 14:20:00','2021-10-13 04:06:00'), --Guatemala a Uruguay // 13h 46min
('ABE1','AA6L','BRA','ESP','2021-11-02 18:00:00','2021-11-03 07:00:00'), --Brasil a España // 13h
('AUU7','AA8A','URY','USA','2021-07-19 19:00:00','2021-07-20 07:31:00'), --Uruguay a Estados Unidos // 12h 31min
('EVP8','E1AE','VEN','PAN','2021-08-05 07:30:00','2021-08-05 09:50:00'), --Venezuela a Panamá // 2h 20min
('BEI9','B7MS','ECU','ITA','2021-09-02 12:00:00','2021-09-03 02:55:00'), --Ecuador a  Italia // 14h 55min
('BMN0','B78A','MEX','NIC','2021-10-04 13:50:00','2021-10-04 19:00:00'), --Mexico a Nicaragua // 6h
('ANV4','A77K','NIC','VEN','2021-07-03 16:00:00','2021-07-03 20:16:00'), --Nicaragua a Venezuela // 4h 16min
('APM7','A32X','PAN','MEX','2021-07-12 20:00:00','2021-07-13 00:05:00'); --Panamá a Mexico // 4h 5min

--
-- creación tabla SALIDAS
--

CREATE TABLE Salidas(
  cod_aerolinea VARCHAR(3) NOT NULL,
  cod_vuelo VARCHAR(4) NOT NULL,
destino VARCHAR(3) NOT NULL, 
tiempo DATETIME NOT NULL,
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
('AAA','AAAA','DUE','2021-07-10 12:00:00','A','AAA'),
('AAA','AAAA','BOL','2021-07-13 15:30:00','A','AAA'),
('AAA','AAAA','COL','2021-08-05 16:00:00','A','AAA'),
('AAA','AAAA','CHL','2021-08-12 15:00:00','A','AAA'),
('AAA','AAAA','CRI','2021-09-10 16:00:00','A','AAA'),
('AAA','AAAA','ECU','2021-09-08 18:00:00','A','AAA'),
('AAA','AAAA','GTM','2021-07-16 09:30:00','A','AAA'),
('AAA','AAAA','BRA','2021-08-05 11:30:00','A','AAA'),
('AAA','AAAA','PER','2021-07-18 13:00:00','A','AAA'),
('AAA','AAAA','URY','2021-10-12 14:20:00','A','AAA'),
('AAA','AAAA','ESP','2021-11-02 18:00:00','A','AAA'),
('AAA','AAAA','USA','2021-07-19 19:00:00','A','AAA'),
('AAA','AAAA','PAN','2021-08-05 07:30:00','A','AAA'),
('AAA','AAAA','ITA','2021-09-02 12:00:00','A','AAA'),
('AAA','AAAA','NIC','2021-10-04 13:50:00','A','AAA'),
('AAA','AAAA','VEN','2021-07-03 16:00:00','A','AAA'),
('AAA','AAAA','MEX','2021-07-12 20:00:00','A','AAA'),

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
