const { Router } = require('express');
const router = Router();
const {
    getUsers,
    createNewUsers,
    getUsersById,
    removeUsers,
    updateUser,
    getProfesores,
    getProfesoresById,
    createNewProfesores,
    removeProfesores,
    updateProfesores
} = require('../connecions/index.connections');

router.get('/', ((req, res) =>
{
    res.send('Hello world')
}));

/*
* Rutas para el API, tenemos diferentes rutas
* */

/*
* para cada una de las funciones construidas para el proyecto:
*
* > getUsers = GET request, muestra todos los usuarios
* > createNewUsers = POST request, realiza un INSERT en la BD
* > removeUsers = REMOVE request, elimina a un usuario de la BD
* > getUsersById = GET request, encuentra un usuario por ID
* > updateUser =
* */
router.get('/users', getUsers);
router.get('/users/:id', getUsersById);
router.post('/users', createNewUsers);
router.delete('/users/:id', removeUsers);
router.put('/users/:id', updateUser);

/*
* para cada una de las funciones construidas para el proyecto:
*
* > getProfesores = GET request, muestra todos los Profesores
* > createNewProfesores = POST request, realiza un INSERT en la BD
* > removeProfesores = REMOVE request, elimina a un Profesores de la BD
* > getProfesoresById = GET request, encuentra un Profesores por ID
*
* */
router.get('/profesores', getProfesores);
router.get('/profesores/:id', getProfesoresById);
router.post('/profesores', createNewProfesores);
router.delete('/profesores/:id', removeProfesores);
router.put('/profesores/:id', updateProfesores);

module.exports = router;