const { Router } = require('express');
const router = Router();
const {
    getUsers,
    createNewUsers,
    getUsersById,
    removeUsers,
    updateUser
} = require('../connecions/index.connecions');

router.get('/', ((req, res) =>
{
    res.send('Hello world')
}));

/*
* Rutas para el API, tenemos diferentes rutas
* para cada una de las funciones construidas para el proyecto:
*
* > getUsers = GET request, muestra todos los usuarios
* > createNewUsers = POST request, realiza un INSERT en la BD
* > removeUsers = REMOVE request, elimina a un usuario de la BD
* > getUsersById = GET request, encuentra un usuario por ID
*
* */
router.get('/users', getUsers);
router.get('/users/:id', getUsersById);
router.post('/users', createNewUsers);
router.delete('/users/:id', removeUsers);
router.put('/users/:id', updateUser);



module.exports = router;