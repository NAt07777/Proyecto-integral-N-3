# Proyecto final integral n°3

El presente documento es el **Proyecto Integral N°3** de ***Argentina Programa 4.0***. Esta es una pequeña solución informática que sirve para mostrar un catálogo de películas y series.

#### Especificaciones
- Servidor: http://127.0.0.1:8080
- Autora: Natalia Infantino

#### Requerimientos
- Node.js v18.16.0
- mysql2 3.6.0
- GIT v2.40.1
- IDE - Visual Studio Code v1.78.2

---
### CONFIGURACION DE ENTORNO
  - #### VARIABLES DE ENTORNO
    Se debe hacer una copia del archivo **.env.dist** y renombrarlo como **.env**. Con respecto a su contenido, es necesario asignar los valores a correspondientes a las variables:
    ``` js
        SERVER_PORT=8080
        SERVER_HOST=127.0.0.1
        DATABASE_NAME=trailerflix


## Resumen del Código

El código a continuación es la implementación de un servidor Express que proporciona una API para acceder al catálogo de películas y series. El servidor incluye las siguientes características:

- Importación de módulos y dependencias necesarios, como Express, dotenv para la gestión de variables de entorno, y Sequelize para interactuar con la base de datos.

- Creación de una instancia del servidor Express y configuración de middleware para analizar solicitudes entrantes en formato JSON y codificadas en URL.

#### Métodos HTTP
| Tipo | Ruta | Descripción |
|------|------|-------------|
| GET | `/categorias` | Obtiene todas las categorías existentes. |
| GET | `/catalogo` | Obtiene el catálogo completo de películas y series. |
| GET | `/catalogo/:id` | Obtiene información detallada sobre una película o serie específica por su ID. |
| GET | `/catalogo/nombre/:nombre` | Realiza una búsqueda de películas o series por nombre o parte de él. |
| GET | `/catalogo/genero/:genero` | Realiza una búsqueda de películas o series por género. |
| GET | `/catalogo/categoria/:categoria` | Realiza una búsqueda de películas o series por categoría. |


- Manejo de rutas inexistentes con una respuesta de error 404.

- Inicio del servidor después de autenticar con la base de datos.

Este código proporciona una base sólida para crear una aplicación web que permite a los usuarios buscar y acceder a información sobre películas y series.

#### Método GET:
- Request:
- ruta estática /categorias

    ``` json
    {
        "id_categoria": 1,
        "nombre": "Serie"
    },
    {
        "id_categoria": 2,
        "nombre": "Película"
    }
    ```
  - Código HTTP: **200** *categorias*
  - Código HTTP: **500** *message: Error en el servidor*

#### Método GET:
- Request:
- ruta estática /catalogo

  ``` json
    {
        "id": 1,
        "poster": "http://trailerflix//posters/1.jpg",
        "titulo": "The Crown",
        "categoria": "Serie",
        "genero": "Drama, Hechos veridicos",
        "resumen": "Este drama narra las rivalidades políticas y el romance de la reina Isabel II, así como los sucesos que moldearon la segunda mitad del siglo XX.",
        "temporadas": 4,
        "reparto": "Claire Fox, Helena Bonham Carter, Matt Smith, Olivia Colman, Tobias Menzies, Vanesa Kirby",
        "trailer": null
    },
    ```
  - Código HTTP: **200** *catalogo*
  - Código HTTP: **500** *message: Error en el servidor*

#### Método GET:
- Request:
- Parámetro obligatorio de tipo URL:
    - 9 *(tipo: integer. Indica el id del catálogo que se requiere obtener)*

  ``` json
    {
    "id": 9,
    "poster": "http://trailerflix//posters/9.jpg",
    "titulo": "Juego de tronos",
    "categoria": "Serie",
    "genero": "Aventura, Drama, Fantasía",
    "resumen": "En un mundo fantástico y en un contexto medieval varias familias, relativas a la nobleza, se disputan el poder para dominar el territorio ficticio de Poniente (Westeros) y tomar el control de los Siete Reinos desde el Trono de Hierro, lugar donde el rey ejerce el poder.",
    "temporadas": 8,
    "reparto": "Emilia Clarke, Kit Harington, Lena Headey, Nikolaj Coster-Waldau, Peter Dinklage, Sophie Turner",
    "trailer": null
  }
    ```
  - Código HTTP: **200** *catalogo*
  - Código HTTP: **400** *error: 'El ID debe ser un número'*
  - Código HTTP: **404** *error: 'No se encontró el catálogo con el ID especificado'*
  - Código HTTP: **500** *message: Error en el servidor*

#### Método GET:
- Request:
- Parámetro obligatorio de tipo URL:
    - Nombre = Big *(tipo: string. Indica parte del nombre del catálogo que se requiere obtener)*

  ``` json
    {
        "id": 11,
        "poster": "http://trailerflix//posters/11.jpg",
        "titulo": "The Big Bang Theory",
        "categoria": "Serie",
        "genero": "Comedia, Fantasía, Ficción",
        "resumen": "Leonard y Sheldon son dos físicos que comparten trabajo y apartamento. La serie comienza con la mudanza de Penny, su nueva y atractiva vecina, y hace hincapié en la dificultad de los físicos para relacionarse con personas fuera de su entorno para dar lugar a situaciones cómicas.",
        "temporadas": 12,
        "reparto": "Jim Parsons, Johnny Galecki, Kaley Cuoco, Kunal Nayyar, Mayim Bialik, Melissa Rauch, Simon Helberg",
        "trailer": "https://www.youtube.com/embed/WBb3fojgW0Q"
    }
    ```
  - Código HTTP: **200** *catalogo*
  - Código HTTP: **404** *error: 'No se encontraron catálogos con el nombre especificado.*
  - Código HTTP: **500** *message: Error en el servidor*


#### Método GET:
- Request:
- Parámetro obligatorio de tipo URL:
    - Género = familia *(tipo: string. Indica el género del catálogo que se requiere obtener)*

  ``` json
    {
        "id": 12,
        "poster": "http://trailerflix//posters/12.jpg",
        "titulo": "Friends",
        "categoria": "Serie",
        "genero": "Comedia, Drama, Familia",
        "resumen": "'Friends' narra las aventuras y desventuras de seis jóvenes de Nueva York: Rachel, Monica, Phoebe, Ross, Chandler y Joey. Ellos forman una unida pandilla de amigos que viven en Manhattan y que suelen reunirse en sus apartamentos o en su bar habitual cafetería, el Central Perk. A pesar de los numerosos cambios que se producen en sus vidas, su amistad es inquebrantable en la dura batalla por salir adelante en sus periplos profesionales y personales.",
        "temporadas": 10,
        "reparto": "Courteney Cox, David Schwimmer, Jennifer Aniston, Lisa Kudrow, Matt LeBlanc, Matthew Perry",
        "trailer": null
    },
    {
        "id": 13,
        "poster": "http://trailerflix//posters/13.jpg",
        "titulo": "Anne with an 'E'",
        "categoria": "Serie",
        "genero": "Drama, Familia, Western",
        "resumen": "Anne Shirley es una niña huérfana que vive en un pequeño pueblo llamado Avonlea que pertenece a la Isla del Príncipe Eduardo, en el año 1890. Después de una infancia difícil, donde fue pasando de orfanato a hogares de acogida, es enviada por error a vivir con una solterona y su hermano. Cuando cumple 13 años, Anne va a conseguir transformar su vida y el pequeño pueblo donde vive gracias a su fuerte personalidad, intelecto e imaginación. Basada en la inolvidable novela.",
        "temporadas": 2,
        "reparto": "Amybeth McNulty, Corrine Koslo, Dalila Bela, Geraldine James, Lucas Jade Zumann, R. H. Thomson",
        "trailer": null
    }
    ```
  - Código HTTP: **200** *catalogo*
  - Código HTTP: **404** *error: 'No se encontraron catálogos con el género especificado.'*
  - Código HTTP: **500** *message: Error en el servidor*
  
  #### Método GET:
- Request:
- Parámetro obligatorio de tipo URL:
    - categoria = serie *(tipo: string. Indica todos los elementos del catálogo que coinciden con la categoria indicada.)*

  ``` json
     {
        "id": 17,
        "poster": "http://trailerflix//posters/17.jpg",
        "titulo": "Halt and Catch Fire",
        "categoria": "Serie",
        "genero": null,
        "resumen": "Situada en los inicios de la década de 1980, un visionario ficticio, un ingeniero electrónico y una prodigiosa ingeniera, se alían a una programadora de software para confrontar con las corporaciones informáticas dominantes de la época. El Personal de la firma y sus socios de negocio, comenzarán una carrera que cambiará la cultura en el Estado de Texas, cuna de las empresas de tecnología, casi de la misma forma que lo es hoy Silicon Valey. \n Esta historia ficticia emula el trabajo realizado, en su momento, por la firma Compaq, cuando clonó el BIOS de las Computadoras Personales IBM, dando vida así al económico mercado de los clones. Mostrando también, a lo largo de sus 4 temporadas, el nacimiento de la arquitectura abierta de hardware, los videojuegos online, las salas de chat y de trueque de productos físicos, los BBS, y las primeras nubes computacionales, hasta la llegada de Internet (sin dejar afuera la guerra de los web browsers).",
        "temporadas": 4,
        "reparto": "Alana Cavanaugh, Kerry Bishé, Lee Pace, Mackenzie Davis, Scoot McNairy, Toby Huss",
        "trailer": "https://www.youtube.com/embed/pWrioRji60A"
    }
    ```
  - Código HTTP: **200** *catalogo*
  - Código HTTP: **404** *error: 'No se encontraron catálogos con la categoría especificada'*
  - Código HTTP: **500** *message: Error en el servidor*
