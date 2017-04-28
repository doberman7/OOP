crear tabla
CREATE TABLE usuarios (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre VARCHAR(64) NOT NULL,
  apellido  VARCHAR(64) NOT NULL,
  email VARCHAR(128) UNIQUE NOT NULL,
  fecha_nacimiento DATETIME NOT NULL,
  genero VARCHAR(10) NOT NULL
);

insertar en la TABLA columnas y valores
sqlite> INSERT INTO usuarios
   ...>  (nombre, apellido, email, fecha_nacimiento, genero)
   ...>  VALUES
   ...>  ('Carlos', 'Ribero', 'carlos@yahoo.com', '1970-11-03', 'masculino');

agregar columna:
ALTER TABLE usuarios ADD COLUMN apodo VARCHAR (64);

actuazlizar datos en columna 
UPDATE usuarios SET apodo='Charly' WHERE ID=1
UPDATE usuarios SET apodo='Doberman7' WHERE ID=1

actualizar las dos columnas con una sola sentencia de SQL.
UPDATE usuarios SET apellido='Rivero' WHERE ID=1, SET fecha_nacimiento='1970-11-03' WHERE ID=1;

actualizar  dos columnas con una sola sentencia de SQL.
UPDATE usuarios SET apellido = 'Rivero', fecha_nacimiento = '1970-11-03' WHERE id = 1;

  