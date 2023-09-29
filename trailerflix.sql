-- Eliminar trailerflix si ya existe
DROP DATABASE IF EXISTS trailerflix;

-- Crear la base de datos 
CREATE DATABASE trailerflix
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

-- Usar base de datos
USE trailerflix;

CREATE TABLE `categorias` (
	`id_categoria` int NOT NULL AUTO_INCREMENT,
	`nombre` varchar(50) NOT NULL,
	PRIMARY KEY (`id_categoria`)
);

CREATE TABLE `actricesyactores` (
	`id_actor` int NOT NULL AUTO_INCREMENT,
	`nombre` varchar(255) NOT NULL,
	PRIMARY KEY (`id_actor`)
);

CREATE TABLE `genero` (
	`id_genero` int NOT NULL AUTO_INCREMENT,
	`nombre` varchar(255) NOT NULL,
	PRIMARY KEY (`id_genero`)
);

CREATE TABLE `catalogo` (
	`catalogo_id` int NOT NULL AUTO_INCREMENT,
	`titulo` varchar(255) NOT NULL,
	`resumen` TEXT NOT NULL,
	`temporadas` int ,
	`poster` varchar(255) NOT NULL,
	`trailer` varchar(255) ,
	`categoria_id` int NOT NULL,
	PRIMARY KEY (`catalogo_id`,`categoria_id`)
);

CREATE TABLE `catalogo_reparto` (
	`catalogo_reparto_id` int NOT NULL,
	`actor_id` int NOT NULL,
	PRIMARY KEY (`catalogo_reparto_id`,`actor_id`)
);

CREATE TABLE `catalogo_genero` (
	`catalogo_genero_id` int NOT NULL,
	`genero_id` int NOT NULL,
	PRIMARY KEY (`catalogo_genero_id`,`genero_id`)
);

ALTER TABLE `catalogo` ADD CONSTRAINT `catalogo_fk0` FOREIGN KEY (`categoria_id`) REFERENCES `categorias`(`id_categoria`);

ALTER TABLE `catalogo_reparto` ADD CONSTRAINT `catalogo_reparto_fk0` FOREIGN KEY (`catalogo_reparto_id`) REFERENCES `catalogo`(`catalogo_id`);

ALTER TABLE `catalogo_reparto` ADD CONSTRAINT `catalogo_reparto_fk1` FOREIGN KEY (`actor_id`) REFERENCES `actricesyactores`(`id_actor`);

ALTER TABLE `catalogo_genero` ADD CONSTRAINT `catalogo_genero_fk0` FOREIGN KEY (`catalogo_genero_id`) REFERENCES `catalogo`(`catalogo_id`);

ALTER TABLE `catalogo_genero` ADD CONSTRAINT `catalogo_genero_fk1` FOREIGN KEY (`genero_id`) REFERENCES `genero`(`id_genero`);

-- Insertar datos en la tabla categorias
INSERT INTO categorias (nombre) VALUES
    ('Serie'),
    ('Película');
    
    -- Insertar datos en la tabla actricesyactores
INSERT INTO actricesyactores (id_actor, nombre) VALUES
(1, 'Pedro Pascal'),
(2, 'Carl Weathers'),
(3, 'Misty Rosas'),
(4, 'Chris Bartlett'),
(5, 'Rio Hackford'),
(6, 'Giancarlo Esposito'),
(7, 'Tom Hopper'),
(8, 'David Castañeda'),
(9, 'Emmy Raver-Lampman'),
(10, 'Robert Sheehan'),
(11, 'Aidan Gallagher'),
(12, 'Elliot Page'),
(13, 'Anya Taylor-Joy'),
(14, 'Thomas Brodie-Sangster'),
(15, 'Harry Melling'),
(16, 'Moses Ingram'),
(17, 'Chloe Pirrie'),
(18, 'Janina Elkin'),
(19, 'Lili Reinhart'),
(20, 'Casey Cott'),
(21, 'Camila Mendes'),
(22, 'Marisol Nichols'),
(23, 'Madelaine Petsch'),
(24, 'Mädchen Amick'),
(25, 'Claire Fox'),
(26, 'Olivia Colman'),
(27, 'Matt Smith'),
(28, 'Tobias Menzies'),
(29, 'Vanesa Kirby'),
(30, 'Helena Bonham Carter'),
(31, 'Millie Bobby Brown'),
(32, 'Henry Cavill'),
(33, 'Sam Claflin'),
(34, 'Louis Partridge'),
(35, 'Adeel Akhtar'),
(36, 'Joaquin Phoenix'),
(37, 'Robert De Niro'),
(38, 'Zazie Beetz'),
(39, 'Frances Conroy'),
(40, 'Brett Cullen'),
(41, 'Shea Whigham'),
(42, 'Robert Downey Jr.'),
(43, 'Chris Evans'),
(44, 'Mark Ruffalo'),
(45, 'Chris Hemsworth'),
(46, 'Scarlett Johansson'),
(47, 'Jeremy Renner'),
(48, 'Emilia Clarke'),
(49, 'Lena Headey'),
(50, 'Sophie Turner'),
(51, 'Kit Harington'),
(52, 'Peter Dinklage'),
(53, 'Nikolaj Coster-Waldau'),
(54, 'Grant Gustin'),
(55, 'Carlos Valdes'),
(56, 'Danielle Panabaker'),
(57, 'Candice Patton'),
(58, 'Jesse L. Martin'),
(59, 'Tom Cavanagh'),
(60, 'Jim Parsons'),
(61, 'Johnny Galecki'),
(62, 'Kaley Cuoco'),
(63, 'Simon Helberg'),
(64, 'Kunal Nayyar'),
(65, 'Melissa Rauch'),
(66, 'Mayim Bialik'),
(67, 'Jennifer Aniston'),
(68, 'Courteney Cox'),
(69, 'Lisa Kudrow'),
(70, 'David Schwimmer'),
(71, 'Matthew Perry'),
(72, 'Matt LeBlanc'),
(73, 'Amybeth McNulty'),
(74, 'Geraldine James'),
(75, 'R. H. Thomson'),
(76, 'Corrine Koslo'),
(77, 'Dalila Bela'),
(78, 'Lucas Jade Zumann'),
(79, 'Gillian Anderson'),
(80, 'David Duchovny'),
(81, 'Mitch Pileggi'),
(82, 'Robert Patrick'),
(83, 'Tom Braidwood'),
(84, 'Bruce Harwood'),
(85, 'Jared Harris'),
(86, 'Stellan Skarsgård'),
(87, 'Emily Watson'),
(88, 'Paul Ritter'),
(89, 'Jessie Buckley'),
(90, 'Adam Nagaitis'),
(91, 'Evan Rachel Wood'),
(92, 'Thandie Newton'),
(93, 'Jeffrey Wright'),
(94, 'Tessa Thompson'),
(95, 'Ed Harris'),
(96, 'Luke Hemsworth'),
(97, 'Lee Pace'),
(98, 'Scoot McNairy'),
(99, 'Mackenzie Davis'),
(100, 'Kerry Bishé'),
(101, 'Toby Huss'),
(102, 'Alana Cavanaugh'),
(103, 'Jessica Chastain'),
(104, 'John Malkovich'),
(105, 'Colin Farrell'),
(106, 'Common'),
(107, 'Geena Davis'),
(108, 'Ioan Gruffudd'),
(109, 'Margot Robbie'),
(110, 'Ewan McGregor'),
(111, 'Mary Elizabeth Winstead'),
(112, 'Jurnee Smollett'),
(113, 'Rosie Perez'),
(114, 'Chris Messina'),
(115, 'Stacy Martin'),
(116, 'Rhona Mitra'),
(117, 'Theo James'),
(118, 'Peter Ferdinando'),
(119, 'Lia Williams'),
(120, 'Toby Jones');

-- Insertar datos en la tabla genero
INSERT INTO genero (id_genero, nombre) VALUES
(1, 'Ciencia Ficción'),
(2, 'Fantasía'),
(3, 'Drama'),
(4, 'Ficción'),
(5, 'Sucesos'),
(6, 'Misterio'),
(7, 'Comedia'),
(8, 'Familia'),
(9, 'Western'),
(10, 'Hechos veridicos'),
(11, 'Suspenso'),
(12, 'Aventura'),
(13, 'Sci-Fi'),
(14, 'Acción'),
(15, 'Tecnología'),
(16, 'Terror'),
(17, 'Historia'),
(18, 'Intriga');



-- Insertar datos en la tabla catalogo
INSERT INTO catalogo (catalogo_id, titulo, resumen, temporadas, poster, trailer, categoria_id) VALUES
(3, 'The Mandalorian', 'Ambientada tras la caída del Imperio y antes de la aparición de la Primera Orden, la serie sigue los pasos de un pistolero solitario en las aventuras que protagoniza en los confines de la galaxia, donde no alcanza la autoridad de la Nueva República.', 2, '/posters/3.jpg', 'https://www.youtube.com/embed/aOC8E8z_ifw', 1),
(4, 'The Umbrella Academy', 'La muerte de su padre reúne a unos hermanos distanciados y con extraordinarios poderes que descubren impactantes secretos y una amenaza que se cierne sobre la humanidad.', 1, '/posters/4.jpg', NULL, 1),
(5, 'Gambito de Dama', 'En los cincuenta, una joven de un orfanato descubre que tiene un increíble don para el ajedrez y recorre el arduo camino a la fama mientras lucha contra las adicciones.', 1, '/posters/5.jpg', NULL, 1),
(2, 'Riverdale', 'El paso a la edad adulta incluye sexo, romance, escuela y familia. Para Archie y sus amigos, también hay misterios oscuros.', 5, '/posters/2.jpg', NULL, 1),
(1, 'The Crown', 'Este drama narra las rivalidades políticas y el romance de la reina Isabel II, así como los sucesos que moldearon la segunda mitad del siglo XX.', 4, '/posters/1.jpg', NULL, 1),
(6, 'Enola Holmes', 'La hermana menor de Sherlock, descubre que su madre ha desaparecido y se dispone a encontrarla. En su búsqueda, saca a relucir el sabueso que corre por sus venas y se encuentra con una conspiración que gira en torno a un misterioso lord, demostrando que su ilustre hermano no es el único talento en la familia.', NULL, '/posters/6.jpg', NULL, 2),
(7, 'Guasón', 'Arthur Fleck (Phoenix) es un hombre ignorado por la sociedad, cuya motivación en la vida es hacer reír. Pero una serie de trágicos acontecimientos le llevarán a ver el mundo de otra forma. Película basada en el popular personaje de DC Comics Joker, conocido como archivillano de Batman, pero que en este film tomará un cariz más realista y oscuro.', NULL, '/posters/7.jpg', 'https://www.youtube.com/embed/zAGVQLHvwOY', 2),
(8, 'Avengers: End Game', 'Después de los devastadores eventos de los Vengadores: Infinity War (2018), el universo está en ruinas. Con la ayuda de los aliados restantes, los Vengadores se reúnen una vez más para revertir las acciones de Thanos y restaurar el equilibrio del universo.', NULL, '/posters/8.jpg', NULL, 2),
(9, 'Juego de tronos', 'En un mundo fantástico y en un contexto medieval varias familias, relativas a la nobleza, se disputan el poder para dominar el territorio ficticio de Poniente (Westeros) y tomar el control de los Siete Reinos desde el Trono de Hierro, lugar donde el rey ejerce el poder.', 8, '/posters/9.jpg', NULL, 1),
(10, 'The Flash', 'Sigue las veloces aventuras de Barry Allen, un joven común y corriente con el deseo latente de ayudar a los demás. Cuando una inesperada partícula aceleradora golpea por accidente a Barry, de pronto se encuentra cargado de un increíble poder para moverse a increíbles velocidades. Mientras Barry siempre ha tenido el alma de un héroe, sus nuevos poderes le han dado la capacidad de actuar como tal.', 6, '/posters/10.jpg', NULL, 1),
(11, 'The Big Bang Theory', 'Leonard y Sheldon son dos físicos que comparten trabajo y apartamento. La serie comienza con la mudanza de Penny, su nueva y atractiva vecina, y hace hincapié en la dificultad de los físicos para relacionarse con personas fuera de su entorno para dar lugar a situaciones cómicas.', 12, '/posters/11.jpg', 'https://www.youtube.com/embed/WBb3fojgW0Q', 1),
(12, 'Friends', '\'Friends\' narra las aventuras y desventuras de seis jóvenes de Nueva York: Rachel, Monica, Phoebe, Ross, Chandler y Joey. Ellos forman una unida pandilla de amigos que viven en Manhattan y que suelen reunirse en sus apartamentos o en su bar habitual cafetería, el Central Perk. A pesar de los numerosos cambios que se producen en sus vidas, su amistad es inquebrantable en la dura batalla por salir adelante en sus periplos profesionales y personales.', 10, '/posters/12.jpg', NULL, 1),
(13, 'Anne with an \'E\'', 'Anne Shirley es una niña huérfana que vive en un pequeño pueblo llamado Avonlea que pertenece a la Isla del Príncipe Eduardo, en el año 1890. Después de una infancia difícil, donde fue pasando de orfanato a hogares de acogida, es enviada por error a vivir con una solterona y su hermano. Cuando cumple 13 años, Anne va a conseguir transformar su vida y el pequeño pueblo donde vive gracias a su fuerte personalidad, intelecto e imaginación. Basada en la inolvidable novela.', 2, '/posters/13.jpg', NULL, 1),
(14, 'Expedientes Secretos \'X\'', 'Fox Mulder y Dana Scully son dos investigadores del FBI que investigan casos sin resolución ni explicación, ya sea por razones paranormales (espíritus, criaturas extrañas, aliens...) ya porque el gobierno se ha encargado de ocultar todo tipo de pruebas. Cuando Mulder tenía doce años, su hermana pequeña fue secuestrada por unos desconocidos, aunque él cree que, en realidad, fue abducida por extraterrestres. En la serie, los dos investigadores intentan, con escaso éxito, arrojar luz sobre algunos de los misterios más oscuros del mundo, fenómenos inexplicables para la ciencia, experiencias cercanas a la muerte, alienígenas o criaturas paranormales.', 11, '/posters/14.jpg', NULL, 1),
(15, 'Chernobyl', 'En abril de 1986, la Central Nuclear de Chernobyl en Ucrania (entonces parte de la Unión Soviética) sufrió una explosión masiva que liberó material radioactivo en Bielorrusia, Rusia, Ucrania, así como en zonas de Europa Occidental. Esta miniserie dramatiza los eventos que llevaron al desastre, los esfuerzos por contenerlo y las consecuencias devastadoras.', 1, '/posters/15.jpg', NULL, 1),
(16, 'Westworld', 'Westworld es una oscura odisea acerca del amanecer de la conciencia artificial y la evolución del pecado. Situada en la intersección del futuro cercano y el pasado reimaginado, explora un mundo donde cada apetito humano, sin importar cuán noble o depravado, puede ser saciado. Está ambientada en un parque temático futurista dirigido por el Dr. Robert Ford (Anthony Hopkins). Las instalaciones cuentan con androides caracterizados del western americano, y gracias a ellos los visitantes pueden introducirse en cualquier tipo de fantasía por muy oscura que sea.', 3, '/posters/16.jpg','https://www.youtube.com/embed/qLFBcdd6Qw0',1),
(17, 'Halt and Catch Fire', 'Situada en los inicios de la década de 1980, un visionario ficticio, un ingeniero electrónico y una prodigiosa ingeniera, se alían a una programadora de software para confrontar con las corporaciones informáticas dominantes de la época. El Personal de la firma y sus socios de negocio, comenzarán una carrera que cambiará la cultura en el Estado de Texas, cuna de las empresas de tecnología, casi de la misma forma que lo es hoy Silicon Valey. \n Esta historia ficticia emula el trabajo realizado, en su momento, por la firma Compaq, cuando clonó el BIOS de las Computadoras Personales IBM, dando vida así al económico mercado de los clones. Mostrando también, a lo largo de sus 4 temporadas, el nacimiento de la arquitectura abierta de hardware, los videojuegos online, las salas de chat y de trueque de productos físicos, los BBS, y las primeras nubes computacionales, hasta la llegada de Internet (sin dejar afuera la guerra de los web browsers).',
4, '/posters/17.jpg', 'https://www.youtube.com/embed/pWrioRji60A', 1 );

-- Insertar datos en la tabla catalogo_reparto
INSERT INTO catalogo_reparto (catalogo_reparto_id, actor_id) VALUES
(1, 25), (1,26), (1,27),(1,28),(1, 29),(1, 30),
(2, 19), (2, 20),(2, 22), (2, 23), (2, 24),
(3, 1),(3, 2), (3,3), (3,4), (3, 5), (3, 6),
(4, 7),(4,8), (4, 9), (4,10), (4, 11),(4, 12),
(5, 13),(5, 14),(5, 15),(5, 16),(5, 17), (5, 18),
(6, 31),(6, 32), (6, 33), (6, 34), (6, 35),
 (7, 36), (7, 37),(7, 38),(7, 39),(7, 40),(7, 41),
(8, 42),(8, 43),(8, 44),(8, 45),(8, 46),(8, 47),
(9, 48),(9, 49),(9, 50),(9, 51),(9, 52),(9, 53),
(10, 54),(10, 55),(10, 56),(10, 57), (10, 58), (10,59),
(11, 60),(11, 61),(11, 62),(11, 63),(11, 64),(11, 65), (11, 66), 
(12, 67),
(12, 68),(12, 69),(12, 70),(12, 71),(12,72),
(13, 73),(13, 74),(13, 75),(13, 76),(13, 77),(13, 78),
(14, 79),(14, 80),(14, 81),(14, 82),(14, 83), (14, 84),
(15, 85),(15, 86),(15, 87),(15, 88),(15, 89), (15, 90),
(16, 91), (16, 92), (16, 93), (16, 94), (16, 95), (16, 96),
(17, 97), (17, 98), (17, 99), (17, 100), (17, 101), (17, 102);

-- Insertar datos en la tabla catalogo_genero
INSERT INTO catalogo_genero (catalogo_genero_id, genero_id) VALUES
(1, 3), (1, 10),
(2, 3), (2, 6), (2, 4),
(3, 1),(3, 2),
(4, 2),(4, 1),
(5, 3),(5, 4), (5, 5),
(6, 4),(6, 5),
(7, 3),(7, 11),
(8, 12),(8, 13),(8, 14),
(9, 12),(9, 3), (9,2),
(10, 1),(10, 2),
(11, 7),(11, 2),(11, 4),
(12, 7),(12, 8), (12, 3),
(13, 3),(13, 8),(13, 9),
(14, 1),(14, 3),
(15, 3),(15, 10),
(16, 1), (16, 9);

CREATE VIEW vista_catalogo AS
SELECT
    c.catalogo_id AS id,
    CONCAT('http://trailerflix/', MAX(c.poster)) AS poster,
    c.titulo,
    cat.nombre AS categoria,
    GROUP_CONCAT(DISTINCT g.nombre ORDER BY g.nombre ASC SEPARATOR ', ') AS genero,
    MAX(c.resumen) AS resumen,
    MAX(c.temporadas) AS temporadas,
    GROUP_CONCAT(DISTINCT a.nombre ORDER BY a.nombre ASC SEPARATOR ', ') AS reparto,
    MAX(c.trailer) AS trailer
FROM catalogo c
INNER JOIN categorias cat ON c.categoria_id = cat.id_categoria
LEFT JOIN catalogo_genero cg ON c.catalogo_id = cg.catalogo_genero_id
LEFT JOIN genero g ON cg.genero_id = g.id_genero
LEFT JOIN catalogo_reparto cr ON c.catalogo_id = cr.catalogo_reparto_id
LEFT JOIN actricesyactores a ON cr.actor_id = a.id_actor
GROUP BY c.catalogo_id, c.titulo, cat.nombre;


SELECT * FROM vista_catalogo;














