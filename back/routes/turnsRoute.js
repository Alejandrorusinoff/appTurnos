const express = require('express')
const router = express.Router()
const turnsController = require('../controllers/turnsController')
const checkJWT = require("../middlewares/jwt");

//Search turn by id
router.get('/:userId/:id',/*  checkJWT, */ turnsController.searchTurnByID) //funciona

//turns history
router.get('/:userId', /* checkJWT,  */turnsController.history) //funciona

//Cancel turns
router.delete('/:id', checkJWT, turnsController.cancel) //funciona

//Edit turns
router.put('/:id', checkJWT, turnsController.editTurn) //funciona

//Create turns
router.post('/', /* checkJWT, */ turnsController.create) //funciona

router.get('/', turnsController.allUser) //funciona

module.exports = router