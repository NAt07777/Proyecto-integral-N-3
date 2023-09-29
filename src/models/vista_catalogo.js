const { DataTypes } = require('sequelize');
const sequelize = require('../connection/connection.js'); 

const VistaCatalogo = sequelize.define('vista_catalogo', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
    },
    poster: {
        type: DataTypes.STRING,
    },
    titulo: {
        type: DataTypes.STRING,
    },
    categoria: {
        type: DataTypes.STRING,
    },
    genero: {
        type: DataTypes.STRING,
    },
    resumen: {
        type: DataTypes.STRING,
    },
    temporadas: {
        type: DataTypes.INTEGER,
    },
    reparto: {
        type: DataTypes.STRING,
    },
    trailer: {
        type: DataTypes.STRING,
    },
}, {
    tableName: 'vista_catalogo', 
    timestamps: false, 
});

module.exports = VistaCatalogo;
