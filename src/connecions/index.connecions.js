//modules postgresql
const pg = require('pg');
const pg_pool = pg.Pool;
const pool = new pg_pool({
    host: 'localhost',
    user: 'postgres',
    password: 'usm-charapter',
    database: 'ayds_usm',
    port: '5432'
});

const getUsers = async (req, res) => {
    const response = await pool.query('SELECT * FROM users'); //mensaje de respuesta
    console.log(response.rows);
    res.status(200).json(response.rows);
};

module.exports = {
    getUsers
}
