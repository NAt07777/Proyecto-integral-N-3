const { DataTypes } = require('sequelize');
const sequelize = require('../connection/connection.js');

const categorias = sequelize.define('categorias', {
    id_categoria: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true,
    },
    nombre: {
        type: DataTypes.STRING,
        allowNull: false,
    }
}, {
    tableName: 'categorias',
    timestamps: false,
});

module.exports = categorias;