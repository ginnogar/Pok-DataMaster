--- TABLA 1 POKEMONES ---
CREATE TABLE Pokemones(
id_pokemon SERIAL PRIMARY KEY,
poke_nombre VARCHAR(50) NOT NULL Unique,
tipo VARCHAR(50) NOT NULL,
habilidad VARCHAR(50) NOT NULL,
ataque INTEGER NOT NULL,
defensa INTEGER NOT NULL,
nivel INT CHECK(nivel >= 1 AND nivel <= 100) NOT NULL,
salud INT CHECK(salud > 0) NOT NULL
);

SELECT * FROM Pokemones
SELECT * FROM pokemones WHERE id_pokemon = 1;
INSERT INTO Pokemones VALUES(1, 'Bulbasaur', 'Planta/Veneno', 'Espesura', 49, 49, 5, 45);
INSERT INTO Pokemones VALUES(2, 'Ivysaur', 'Planta/Veneno', 'Espesura', 62, 63, 16, 60);
INSERT INTO Pokemones VALUES(3, 'Venusaur', 'Planta/Veneno', 'Espesura', 82, 83, 32, 80);
INSERT INTO Pokemones VALUES(4, 'Charmander', 'Fuego', 'Mar Llamas', 52, 43, 5, 39);
INSERT INTO Pokemones VALUES(5, 'Charmeleon', 'Fuego', 'Mar Llamas', 64, 58, 16, 58);
INSERT INTO Pokemones VALUES(6, 'Mega-Charizard', 'Fuego/Volador', 'Sequía', 104, 78, 36, 78);

--ACTUALIZAR la informacion de un Pokemon / NOMBRE Y TIPO DOS DATOS ACTUALIZADOS 2 ATRIBUTOS
UPDATE Pokemones
SET poke_nombre = 'Bulbasaur', tipo = 'Planta/Veneno'
WHERE id_pokemon = 1;
--O SI SOLO QUERES ACTUALIZAR DATOS DE UNA SOLA COLUMNA
UPDATE pokemones 
SET tipo = 'Planta' --ACA YA SE PONE EL CAMBIO QUE SE QUIERE HACER
WHERE tipo = 'Planta/Veneno'; --Y ACA SE REFERENCIA COMO ESTABA NADA MAS 

DELETE FROM POKEMONES WHERE id_pokemon = 5;


--- TABLA 2 ENTRENADORES ---
CREATE TABLE Entrenadores(
id_entrenador SERIAL PRIMARY KEY,
entre_nombre VARCHAR(100) NOT NULL UNIQUE,
ciudad VARCHAR(100) NOT NULL, 
experiencia INTEGER CHECK(experiencia >= 0) NOT NULL
);

SELECT * FROM Entrenadores
SELECT * FROM entrenadores WHERE id_entrenador = 1;
INSERT INTO Entrenadores VALUES(1, 'Ash Ketchum', 'Pueblo Paleta', 100);
INSERT INTO Entrenadores VALUES(2, 'Misty', 'Ciudad Celeste', 80);
INSERT INTO Entrenadores VALUES(3, 'Brock', 'Ciudad Plateada', 90);
INSERT INTO Entrenadores VALUES(4, 'Gary Oak', 'Pueblo Paleta', 95);
INSERT INTO Entrenadores VALUES(5, 'Erika', 'Ciudad Azulona', 85);
INSERT INTO Entrenadores VALUES(6, 'Blaine', 'Isla Canela', 95);

--ACTUALIZAR la informacion de un Entrenador / NOMBRE Y TIPO DOS DATOS ACTUALIZADOS 2 ATRIBUTOS
UPDATE Entrenadores
SET entre_nombre = 'Ash Ketchum', ciudad = 'Pueblo Paleta'
WHERE id_entrenador = 1;
--O SI SOLO QUERES ACTUALIZAR DATOS DE UNA SOLA COLUMNA
UPDATE Entrenadores 
SET entre_nombre = 'Blaine' --ACA YA SE PONE EL CAMBIO QUE SE QUIERE HACER
WHERE entre_nombre = 'Blaines'; --Y ACA SE REFERENCIA COMO ESTABA NADA MAS 

DELETE FROM Entrenadores WHERE id_entrenador = 5;


--- TABLA 3 intermedia Entrenadores - Pokemones ---
CREATE TABLE entrenadores_pokemones(
id_entrenador INT REFERENCES Entrenadores(id_entrenador) ON DELETE CASCADE,
id_pokemon INT UNIQUE REFERENCES Pokemones(id_pokemon) ON DELETE CASCADE, --UN POKEMON PUEDE SER ASOCIADO A UN ENTRENADOR
PRIMARY KEY (id_entrenador, id_pokemon) --Define una 'clave primaria compuesta' para asegurar que no haya duplicados de la combinacion de id_entrenador y id_pokemon
);

SELECT * FROM entrenadores_pokemones 
INSERT INTO entrenadores_pokemones VALUES(1, 1);
INSERT INTO entrenadores_pokemones VALUES(2, 2);
INSERT INTO entrenadores_pokemones VALUES(3, 3);
INSERT INTO entrenadores_pokemones VALUES(4, 4);
INSERT INTO entrenadores_pokemones VALUES(5, 5);
INSERT INTO entrenadores_pokemones VALUES(6, 6);


--TABLA 4 BATALLAS
CREATE TABLE Batallas(
id_batalla SERIAL PRIMARY KEY,
fecha DATE NOT NULL,
lugar VARCHAR(100) NOT NULL
);

SELECT * FROM BATALLAS
INSERT INTO Batallas VALUES(1, '24-07-2024', 'Gimnasio Paleta');
INSERT INTO Batallas VALUES(2, '24-07-2024', 'Gimnasio Celeste');
INSERT INTO Batallas VALUES(3, '24-07-2024', 'Gimnasio Plateada');
INSERT INTO Batallas VALUES(4, '24-07-2024', 'Gimnasio Azulona');
INSERT INTO Batallas VALUES(5, '24-07-2024', 'Gimnasio Fucsia');
INSERT INTO Batallas VALUES(6, '24-07-2024', 'Liga Pokémon');

--ACTUALIZAR la informacion de una Batalla / NOMBRE Y TIPO DOS DATOS ACTUALIZADOS 2 ATRIBUTOS
UPDATE Batallas
SET fecha = '24-07-2024', lugar = 'Liga Pokémon'
WHERE id_batalla = 6;
--O SI SOLO QUERES ACTUALIZAR DATOS DE UNA SOLA COLUMNA
UPDATE Batallas 
SET fecha = '24-07-2024' --ACA YA SE PONE EL CAMBIO QUE SE QUIERE HACER
WHERE id_batalla = '25-07-2024'; --Y ACA SE REFERENCIA COMO ESTABA NADA MAS 

DELETE FROM Batallas WHERE id_batalla = 6;

--TABLA 5 intermedia Participantes - Batallas
CREATE TABLE participantes_batallas(
id_batalla INT REFERENCES Batallas(id_batalla) ON DELETE CASCADE,
id_entrenador INT REFERENCES Entrenadores(id_entrenador) ON DELETE CASCADE,
id_pokemon INT REFERENCES Pokemones(id_pokemon) ON DELETE CASCADE,
resultado VARCHAR(50) NOT NULL,
PRIMARY KEY (id_batalla, id_entrenador, id_pokemon)
);

SELECT * FROM participantes_batallas
INSERT INTO participantes_batallas VALUES(1, 1, 1, 'Gano Ivysaur');
INSERT INTO participantes_batallas VALUES(1, 2, 2, 'Perdio Bulbasaur');
INSERT INTO participantes_batallas VALUES(2, 3, 3, 'Pardio Charmander');
INSERT INTO participantes_batallas VALUES(2, 4, 4, 'Gano Venusaur');
INSERT INTO participantes_batallas VALUES(3, 5, 5, 'Gano Mega-Charizard');
INSERT INTO participantes_batallas VALUES(3, 6, 6, 'Perdio Charmeleon');


--MODIFICAMOS EL NOMBRE DE UNA COLUMNA (Ejemplo)
ALTER TABLE Pokemones
RENAME COLUMN nombre TO poke_nombre;
--MDOFICAMOS EL NOMBRE DE UNA COLUMNA (Ejemplo)
ALTER TABLE entrenadores
RENAME COLUMN nombre TO entre_nombre;

-- ELIMINAR REGISTRO DE ENTRRNADORES EN FORMA CASCADE
/*/ DATO IMPORTANTE RESPECTO A UTILIZAR EL "ON DELETE CASCADE"
SIMPLIFICA LA OPERACION ELIMINAR. NO TIWENES QUE VOLVER A HACER 
CONSULTAS ADICIONALES PARA ELIMINAR MANUALMENTE LAS FILAS DEPENDIENTES 
SI ELIMINAS UN ENTRENADOR AUTOMATICAMENTE ELIMINA:
entrenadores_pokemon y participanetes_batallas
/*/

DELETE FROM Entrenadores WHERE id_entrenador = 2;

/*/ CONSULTAS MULTI-TABLE
COMBINACION DE DATOS DE MULTIPLEA TABLAS /*/

--MOSTRAR INFORMACION DETALLADA SOBRE EL POKEMON Y SUS CARACTERSTICAS
SELECT
b.id_batalla,
b.fecha,
b.lugar,
e.id_entrenador,
e.entre_nombre,
p.id_pokemon,
p.poke_nombre,
pb.resultado

FROM Batallas b
JOIN participantes_batallas pb ON b.id_batalla = pb.id_batalla
JOIN Entrenadores e ON pb.id_entrenador = e.id_entrenador
JOIN Pokemones p ON pb.id_pokemon = p.id_pokemon
ORDER BY b.fecha, b.id_batalla;

--MOSTRAR INFORMACION SOBRE LOS POKEMONES Y ENTRENADORES
SELECT
e.id_entrenador,
e.entre_nombre,
e.ciudad,
e.experiencia,
e.id_pokemon,
e.poke_nombre,
p.tipo,
p.habilidd,
p.ataque,
p.defensa,
p.nivel,
p.salud

FROM Entrenadores e
JOIN entrenadores_pokemones ep ON e.id_entrenador = ep.id_entrenador
JOIN Pokemones p ON ep.id_pokemon = p.id_pokemon;

--ELIMINARA EL REGISTRO ESPECIFICO DE participantes_batallas QUE COINCIDE CON LOS VALORES PROPORCIONADOS
DELETE FROM participantes_batallas
WHERE id_batalla = 1 AND id_entrenador = 1 AND id_pokemon = 1;


--SELECCION PARA LEER LA INFORMACION DE LAS TABLAS
select * from Pokemones

select * from Entrenadores

select * from entrenadores_pokemones 

select * from batallas

select * from participantes_batallas