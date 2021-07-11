//modules postgresql
const pg = require('pg');
const pg_pool = pg.Pool;
const pool = new pg_pool({
    host: 'localhost',
    user: 'postgres',
    password: 'usm-charapter',
    database: 'ayds_proyect',
    port: '5432'
});

//enlistar o mostrar en pantalla los usuarios de postgres
const getUsers = async (req, res) => {
    //recordar cambiar luego de que me entregen la base de datos correcta
    const response = await pool.query('SELECT * FROM users.users'); //mensaje de respuesta
    console.log(response.rows); //se muestra en formato row
    res.status(200).json(response.rows); //codigo de status
};

const createNewUsers = async (req, res) => {
    //recordar cambiar luego de que me entregen la base de datos correcta
    const { user, correo} = (req.body); //se muestra en formato row
    const response = await pool.query('INSERT INTO users.users (name,email) VALUES ($1,$2)',[user,correo]);
    res.status(200);
    console.log(response);
    res.send('Usuario creado'); //codigo de status
};

const getUsersById = async (req, res) => {
    const response = await pool.query('SELECT * FROM users.users WHERE id = $1', [parseInt(req.params.id)]);
    res.status(200).json(response.rows);
};

const removeUsers = async (req, res) => {
    const id = parseInt(req.params.id)
    const response = await pool.query('DELETE FROM users.users WHERE id = $1', [parseInt(req.params.id)]);
    console.log(response);
    res.json(`User ${id} deleted Successfully`);
};

const updateUser = async (req, res) => {
    const id = parseInt(req.params.id);
    const { name, email } = req.body;
    const response =await pool.query('UPDATE users.users SET name = $1, email = $2 WHERE id = $3', [
        name,
        email,
        id
    ]);
    res.json('User Updated Successfully');
};

//Profesores
const getProfesores = async (req, res) => {
    //recordar cambiar luego de que me entregen la base de datos correcta
    const response = await pool.query('SELECT * FROM users.profesores'); //mensaje de respuesta
    console.log(response.rows); //se muestra en formato row
    res.status(200).json(response.rows); //codigo de status
};

const createNewProfesores = async (req, res) => {
    //recordar cambiar luego de que me entregen la base de datos correcta
    const { user, correo} = (req.body); //se muestra en formato row
    const response = await pool.query('INSERT INTO users.profesores (name,email) VALUES ($1,$2)',[user,correo]);
    res.status(200);
    console.log(response);
    res.send('Usuario creado'); //codigo de status
};

const getProfesoresById = async (req, res) => {
    const response = await pool.query('SELECT * FROM users.profesores WHERE id = $1', [parseInt(req.params.id)]);
    res.status(200).json(response.rows);
};

const removeProfesores = async (req, res) => {
    const id = parseInt(req.params.id)
    const response = await pool.query('DELETE FROM users.profesores WHERE id = $1', [parseInt(req.params.id)]);
    console.log(response);
    res.json(`User ${id} deleted Successfully`);
};

const updateProfesores = async (req, res) => {
    const id = parseInt(req.params.id);
    const { name, email } = req.body;
    const response =await pool.query('UPDATE users.profesores SET name = $1, email = $2 WHERE id = $3', [
        name,
        email,
        id
    ]);
    res.json('User Updated Successfully');
};

module.exports = {
    getUsers,
    createNewUsers,
    getUsersById,
    removeUsers,
    updateUser,
    getProfesores,
    createNewProfesores,
    getProfesoresById,
    removeProfesores,
    updateProfesores
};