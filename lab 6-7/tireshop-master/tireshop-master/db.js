const mysql = require('mysql2')

const pool = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    database: 'tires',
    password: '1111'
})

module.exports = pool