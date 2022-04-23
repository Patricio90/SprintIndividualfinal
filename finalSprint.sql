/* Creación de tablas e ingreso de datos */
CREATE TABLE clientes (
idclientes INT NOT NULL PRIMARY KEY, 
nombre_cliente VARCHAR(50) NOT NULL,
apellido VARCHAR(30) NOT NULL,
edad INT, 
email VARCHAR(20),
N°frecuencia_aplic INT NOT NULL
);

INSERT INTO clientes (idclientes, nombre_cliente, apellido, edad, email, N°frecuencia_aplic)
VALUES ('2150','José','Benavente','43','jbenavente@ctc.cl','1'),
('2151','Marcela','Fuentes','23','mfuentes@asd.com','2'),
('2152','Francisca','Valdivia','46','fvaldivia@dask.com','4'),
('2153','Leonardo','Lorenzini','54','llorenzini@fhj.cl','3'),
('2154','Andrea','Bragado','23','abragado@fyt.com','5');

CREATE TABLE operario (
idoperario INT NOT NULL PRIMARY KEY, 
nombre_operario VARCHAR(50) NOT NULL,
apellido VARCHAR(30) NOT NULL,
edad INT, 
email VARCHAR(20),
N°frecuencia_soporte INT NOT NULL
);

INSERT INTO operario (idoperario, nombre_operario, apellido, edad, email, N°frecuencia_soporte)
VALUES ('3150','Jorge','Perez','23','jperez@jop.cl','6'),
('3151','Sandra','Lopez','34','slopez@jop.cl','8'),
('3152','Fernanda','Lira','38','flira@jop.cl','9'),
('3153','Lorenzo','Jara','29','ljara@jop.cl','11'),
('3154','Carla','Soto','23','csoto@jop.cl','10');

CREATE TABLE cliente_operario(
idclientes INT NOT NULL,
idoperario INT NOT NULL,
nombre_operario VARCHAR(50) NOT NULL,
nombre_cliente VARCHAR(50) NOT NULL,
fecha_soporte DATETIME DEFAULT CURRENT_TIMESTAMP(),
evaluacion_soporte INT NOT NULL,
PRIMARY KEY (idclientes, idoperario),
CONSTRAINT cliente_operario_clientes_fk FOREIGN KEY (idclientes) REFERENCES clientes(idclientes),
CONSTRAINT cliente_operario_operario_fk FOREIGN KEY (idoperario) REFERENCES operario(idoperario)
);

INSERT INTO cliente_operario(idclientes, idoperario, nombre_operario, nombre_cliente, fecha_soporte, evaluacion_soporte)
VALUES ('2151','3150','Jorge','Marcela','12-06-21','6'),
('2151','3151','Sandra','Marcela','05-01-22','5'),
('2152','3152','Fernanda','Francisca','15-03-22','7'),
('2153','3153','Lorenzo','Leonardo','04-04-22','4'),
('2154','3154','Carla','Andrea','03-03-22','3'),
('2150','3153','Lorenzo','Jose','14-01-22','7'),
('2154','3152','Fernanda','Andrea','23-01-22','5'),
('2152','3151','Sandra','Francisca','25-03-22','6'),
('2150','3150','Jorge','Jose','05-04-22','7'),
('2151','3154','Carla','Marcela','29-03-22','4');

/* Seleccione las 3 operaciones con mejor evaluación.*/
SELECT idoperario,(evaluacion_soporte) FROM cliente_operario order by evaluacion_soporte desc limit 3;

/* Seleccione las 3 operaciones con menos evaluación. */
SELECT idoperario,(evaluacion_soporte) FROM cliente_operario order by evaluacion_soporte asc limit 3;

/* Seleccione al operario que más soportes ha realizado.*/
SELECT Max(N°frecuencia_soporte) FROM operario;

/* Seleccione al cliente que menos veces ha utilizado la aplicación. */
SELECT nombre_cliente, N°frecuencia_aplic FROM clientes ORDER BY N°frecuencia_aplic asc limit 1;

/* Agregue 10 años a los tres primeros usuarios registrados. */ 
UPDATE clientes SET edad = +10 where idclientes = 3;
/*Renombre todas las columnas ‘correo electrónico’.El nuevo nombre debe ser email.*/
 ALTER TABLE clientes rename column correo_electronico to email;
 ALTER TABLE operario rename column correo_electronico to email; 
 
/*Seleccione solo los operarios mayores de 20 años. */
SELECT nombre_operario FROM operario WHERE edad > 20;