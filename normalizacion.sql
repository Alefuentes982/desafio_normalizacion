CREATE DATABASE normalizacion;

-----Tablas-------
    CREATE TABLE lectores(id_lector INT,
    nombre_completo VARCHAR(60),
    PRIMARY KEY(id_lector));

    CREATE TABLE autores(id_autor INT,
    nombre_completo VARCHAR(60),
    PRIMARY KEY(id_autor));

    CREATE TABLE editorial(editorial_id INT,
    nombre_editorial VARCHAR(40),
    PRIMARY KEY(editorial_id));

    CREATE TABLE libros(id_libro INT,
    codigo INT,
    titulo VARCHAR(50),
    editorial_id INT, 
    PRIMARY KEY(id_libro),
    FOREIGN KEY(editorial_id) REFERENCES editorial(editorial_id));

----- Tabla intermedia------
    CREATE TABLE autor(id_autor_libro INT,
    libro_id INT,
    autor_id INT,
    PRIMARY KEY (id_autor_libro),
    FOREIGN KEY(libro_id) REFERENCES libros(id_libro),
    FOREIGN KEY(autor_id) REFERENCES autores(id_autor));

    CREATE TABLE devolucion(devolucion_id INT,
    id_libro INT, 
    id_lector INT,
    fecha_devolucion DATE,
    PRIMARY KEY(devolucion_id), 
    FOREIGN KEY(id_libro) REFERENCES libros(id_libro),
    FOREIGN KEY(id_lector) REFERENCES lectores(id_lector));