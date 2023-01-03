"use strict";

const mysql = require('mysql');

const db = mysql.createConnection({
    host: '34.64.216.95',
    user: 'root',
    password: 'asdf1234',
    database: 'user_db',
    port: 3306,
});

db.connect();

module.exports = db;