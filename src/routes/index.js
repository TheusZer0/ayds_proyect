const { Router } = require('express');
const router = Router();
const { getUsers } = require('../connecions/index.connecions');

router.get('/', ((req, res) =>
{
    res.send('Hello world')
}));

router.get('/users', getUsers);


module.exports = router;