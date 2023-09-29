// Importar módulo express
const express = require('express');

// Importo módulo para cargar variables de entorno.
const dotenv = require('dotenv');
dotenv.config();

// Importo el operador de sequelize Op.
const { Op } = require('sequelize');

// Desestructuración para importar modelos.
const categorias = require('./models/categorias.js');
const VistaCatalogo = require('./models/vista_catalogo.js');

// Desestructuración para importar funciones de connection.js. 
const sequelize = require("./connection/connection.js");



// creo una instancia del servidor Express.
const server = express();


// Middleware que habilita el análisis de solicitudes entrantes en formato JSON.
server.use(express.json());
// Middleware que habilita el análisis de solicitudes entrantes codificadas en URL.
server.use(express.urlencoded({extended: true}));



// Obtener todas las categorias existentes.
server.get('/categorias', async (req, res) =>  {
    try {
        const categoria = await categorias.findAll();
        res.status(200).send(categoria);
    } catch (error) {
        console.error('Error al buscar categorías:', error);
        res.status(500).send({message: 'Error en el servidor'});
    }
});


// Obtener el catálogo completo.
server.get('/catalogo', async (req, res) => {
    try {
        const catalogo = await VistaCatalogo.findAll();
        res.status(200).json(catalogo); 
    } catch (error) {
        console.error('Error en la consulta a la vista de catálogo:', error);
        res.status(500).send({message: 'Error en el servidor'});
    }
});
// obtener catálogo por id.
server.get('/catalogo/:id' , async (req, res) =>  {
    const { id } = req.params;

    if (isNaN(id)) 
        return res.status(400).json({ error: 'El ID debe ser un número' });

    const idNumber = Number(id);
    
    try {
        const catalogo = await VistaCatalogo.findOne({
            where: {
                id: idNumber
            }
        });
        if (!catalogo) return res.status(404).json({ error: 'No se encontró el catálogo con el ID especificado' });
        res.status(200).json(catalogo);
    } catch (error) {
        console.error('Error al buscar por id:', error);
        res.status(500).send({message: 'Error en el servidor'});
    }
});

// Obtener peliculas y series por su nombre o parte de este.
server.get('/catalogo/nombre/:nombre', async (req, res) => {
    const { nombre } = req.params;

    try {
        const catalogo = await VistaCatalogo.findAll({
            where: {
                titulo: {
                    [Op.like]: `%${nombre}%`
                }
            }
        });

        if (catalogo.length === 0) {
            return res.status(404).json({error: 'No se encontraron catálogos con el nombre especificado.'});
        }

        res.status(200).json(catalogo);
    } catch (error) {
        console.error('Error al buscar por nombre:', error);
        res.status(500).json({ error: 'Error en el servidor' });
    }
});

// Obtener peliculas o series por género.
server.get('/catalogo/genero/:genero', async (req, res) => {
    const { genero } = req.params;

    try {
        const catalogo = await VistaCatalogo.findAll({
            where: {
                genero: {
                    [Op.like]: `%${genero}%`
                }
            }
        });

        if (catalogo.length === 0) {
            return res.status(404).json({error: 'No se encontraron catálogos con el género especificado.'});
        }

        res.status(200).json(catalogo);
    } catch (error) {
        console.error('Error al buscar por género:', error);
        res.status(500).json({ error: 'Error en el servidor' });
    }
});

// Obtener película o serie por categoria.
server.get('/catalogo/categoria/:categoria', async (req, res) => {
    const { categoria } = req.params;

    try {
        const catalogo = await VistaCatalogo.findAll({
            where: {
                categoria: {
                    [Op.like]: `%${categoria}%`
                }
            }
        });

        if (catalogo.length === 0) {
            return res.status(404).json({error: 'No se encontraron catálogos con la categoría especificada'});
        }

        res.status(200).json(catalogo);
    } catch (error) {
        console.error('Error al buscar por categoría:', error);
        res.status(500).json({message: 'Error en el servidor'});
    }
});

// Control de rutas inexistentes.
server.use('*', (req, res) => {
    res.status(404).send(`<h1>Error 404</h1><h3>La URL indicada no existe en este servidor</h3>`);
});


// Método oyente de solicitudes
sequelize.authenticate().then(()=>{
    server.listen(process.env.PORT, process.env.HOST, () => {
        console.log(`El servidor está escuchando en: http://${process.env.HOST}:${process.env.PORT}`);
    });
}).catch(()=>{
    console.log("Hubo un problema con la conexión a la base de datos.")
});
