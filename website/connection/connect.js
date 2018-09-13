const mysql = require('mysql');
const { project } = require('../connection/connections');

const stuff = {
    /**
    * Make a database query call using direct sql.
    * @param {string} db Database name
    * @param {string} sql Sql statement to run
    * @param {string} [args] Optional arguments
    * @returns {Promise<[queryResult]>}
    **/
    querysql: (sql, args) => {
        if (args) sql = mysql.format(sql, args);
        return new Promise((resolve, reject) => {
            project.query(sql, (err, result) => {
                if (err) {
                    console.log('Error during database call: \nsql: ' + sql + '\nSQL message: ' + err.sqlMessage);
                    reject(Error(err.code));
                } else resolve(result);
            });
        });
    },
}
module.exports = stuff;