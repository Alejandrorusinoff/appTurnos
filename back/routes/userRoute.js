const express = require('express')
const router = express.Router()
const authController = require('../controllers/authController')

//Logueamos un usuario
router.post('/login', authController.login)

//Creamos un usuario
router.post('/register', authController.register)

module.exports = router;