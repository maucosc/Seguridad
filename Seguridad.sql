CREATE DATABASE seguridad;
USE seguridad;

CREATE TABLE categoria(
	id INT AUTO_INCREMENT,
	nombre VARCHAR (15),
	
	PRIMARY KEY (id),
	UNIQUE (nombre)
);


CREATE TABLE tipo_cliente(
	id INT AUTO_INCREMENT,
	nombre VARCHAR (15),
	
	PRIMARY KEY (id),
	UNIQUE (nombre)
);


CREATE TABLE tipo_pago(
	id INT AUTO_INCREMENT,
	nombre VARCHAR (15),
	
	PRIMARY KEY (id),
	UNIQUE (nombre)
);


CREATE TABLE vendedor(
	id INT AUTO_INCREMENT,
	nombre VARCHAR (15),
	tele VARCHAR (9),
	nacim DATE,
	
	
	PRIMARY KEY (id),
	UNIQUE (nombre)
);


CREATE TABLE proveedor(
	id INT AUTO_INCREMENT,
	nombre VARCHAR (15),
	direccion VARCHAR (30),
	tele VARCHAR (9),
	
	PRIMARY KEY (id),
	UNIQUE (nombre)
);


CREATE TABLE producto(
	id INT AUTO_INCREMENT,
	nombre VARCHAR (15),
	stock INT,
	precio INT,
	categoria_id_fk INT,
	
	PRIMARY KEY (id),
	UNIQUE (nombre)
	
	FOREIGN KEY (categoria_id_fk) REFERENCES categoria(id)
);


CREATE TABLE producto_proveedor(
	id INT AUTO_INCREMENT,
	producto_id_fk INT,
	proveedor_id_fk INT,
	
	PRIMARY KEY (id),
	
	FOREIGN KEY (producto_id_fk) REFERENCES producto(id),
	FOREIGN KEY (proveedor_id_fk) REFERENCES proveedor(id)
);


CREATE TABLE cliente(
	id INT AUTO_INCREMENT,
	nombre VARCHAR (15),
	empresa VARCHAR (20),
	tipo_cliente_id_fk INT,
	
	PRIMARY KEY (id),
	UNIQUE (nombre),
	
	FOREIGN KEY (tipo_cliente_id_fk) REFERENCES tipo_cliente(id)
);


CREATE TABLE detalle(
	id INT AUTO_INCREMENT,
	producto_proveedor_fk INT,
	cantidad VARCHAR,
	precio INT,
	
	PRIMARY KEY (id),
	
	FOREIGN KEY (producto_proveedor_fk) REFERENCES producto_proveedor(id)
);


CREATE TABLE venta(
	id INT AUTO_INCREMENT,
	vendedor_id_fk INT,
	cliente_id_fk INT,
	tipo_pago_id_fk INT,
	detalle_id_fk INT,
	
	PRIMARY KEY (id),
	
	FOREIGN KEY (vendedor_id_fk) REFERENCES vendedor(id)
	FOREIGN KEY (cliente_id_fk) REFERENCES cliente(id)
	FOREIGN KEY (tipo_pago_id_fk) REFERENCES tipo_pago(id)
	FOREIGN KEY (detalle) REFERENCES detalle(id)
);
