const mysql = require('mysql'), creds = require('../config.json');

const pools = {
    project: mysql.createPool({
        connectionLimit: creds.project,
        host: creds.mysql.host,
        user: creds.mysql.user,
        password: creds.mysql.password,
        database: 'website',
        multipleStatements: true,
    }),
};

module.exports = pools;
