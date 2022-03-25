const express = require('express')
const router = express.Router()
const userRoute = require('./userRoute')
const turnsRoute = require('./turnsRoute')

//Ruta de register y login
router.use('/user', userRoute);

//Ruta de añadir, buscar y vincular empleados a la organizacion y a los datos del covid 
router.use('/turns', turnsRoute)

module.exports = router