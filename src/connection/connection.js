
// importo la clase Sequelize del módulo 'sequelize'.
const { Sequelize } = require('sequelize');

//Módulo para trabajar con rutas y directorios.
const path = require('path');

//Importo dotenv para cargar variables de entorno en '.env'
require('dotenv').config({path: path.join(__dirname, '.env')});

//  creo una instancia de Sequelize 
const sequelize = new Sequelize(process.env.DATABASE, process.env.DBUSER, process.env.PASSWORD, {
    host: process.env.HOST,
    dialect: 'mysql',
    port: 3307,
});

//Exportar elementos desde un módulo para utilizarlos en server.js.
module.exports = sequelize;