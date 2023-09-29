const { DataTypes } = require('sequelize');
const sequelize = require('../connection/connection.js');

const catalogo = sequelize.define('catalogo', {
    catalogo_id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true,
    },
    titulo: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    resumen: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    temporadas: {
        type: DataTypes.INTEGER,
        default: 'N/A'
    },
    poster: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    trailer: {
        type: DataTypes.STRING,
        default: 'N/A'
    },
    categoria_id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        allowNull: false,
    }
},
    {
        tableName: 'catalogo',
        timestamps: false,
    });
    

