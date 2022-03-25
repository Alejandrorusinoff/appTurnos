const Users = require('../db/models/users')
const Turns = require('../db/models/turns')
const { find } = require('../db/models/users')

module.exports = {
    //Buscar todos los turnos del usuario
    history: function (req, res) {
        const {userId} = req.params
        Users.findById(userId).populate('turns')
        .then(turns => res.json(turns))
    },

    //Buscar los turnos por ID
    searchTurnByID: function (req, res) {
        const {userId, id} = req.params
        Turns.findById(id)
        .then(turn => res.json(turn))
    },

    //Crear turnos
    create: function(req, res) {
        const { specialist, turnDateandTime, additionalInformation, location, direction, userId } = req.body
        console.log(req.body)
      /*   Turns.create({ specialist, turnDateandTime, additionalInformation, location, direction, userId })
        //Creamos el turno
        .then(turn => { 
            Users.findOne({_id:userId})
            .then(user => {
                console.log(user)
                user.turns.push(turn)
                user.save() 
            }).catch(err => res.json(err))
        })
        .catch(err => res.status(500).json(err)) */
    },

    //Cancelar turno
    cancel: function (req, res) {
        const { id } = req.params
        Turns.deleteOne({ _id: id })
        .then(cancelTurn => {
            res.json(cancelTurn)
        })
    },

    //Editar turno
    editTurn: function (req, res) {
        const { id } = req.params
        const { specialist, turnDateandTime, additionalInformation, location, direction, userId } = req.body
        Turns.findById(id)
        .then((turn) => {
            turn.specialist = specialist, 
            turn.turnDateandTime = turnDateandTime, 
            turn.additionalInformation = additionalInformation, 
            turn.location = location, 
            turn.direction = direction,
            turn.userId = userId,
            turn.save()
            res.json(turn)
        })
        .catch(err => res.json(err))  
    },

    allUser: function(req, res) {
        Users.find({})
        .then(users => res.json(users))
    }
}




