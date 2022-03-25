const Users = require('../db/models/users')
const jwt = require('jsonwebtoken')
const bcrypt = require("bcrypt");

module.exports = {
    //Login
    login: function(req, res) {
        const { email, password } = req.body
        console.log("req.body ----> ", req.body)
        Users.findOne({email})/* .populate('turns') */
        .then(user => {
            /* console.log('user ---> ', user) */
            const tokenPassword = user.password
            if(!user) res.json("Usuario no encontrado")
            else{
                if(bcrypt.compareSync(password, user.password)) {
                    let token = jwt.sign({tokenPassword}, 'albondiga', {expiresIn: '7d'})
                    res.json({token, user})
                }
                else{
                    res.json("Password inválido")
                }
            }
        })
        .catch(err => res.status(500).json(err))
    },

    //Register
    register: function(req, res) {
        //creamos el organizacion
        const {name, lastName, province, location, direction, description, dni, DD, MM, YYYY, email, password} = req.body
        console.log(req.body)
        const dateOfBirth = `${DD} / ${MM} / ${YYYY}`
        Users.create({name, lastName, province, location, direction, description, dni, dateOfBirth, email, password})
        //creamos el token
        .then(user => {
            let token = jwt.sign({user}, 'albondiga', {expiresIn: '7d'})
            res.json( user )
        })
        .catch(err => res.status(500).json(err))
    }
}



//        let json = """
//        {
//            "name": "Durian",
//            "points": 600,
//            "description": "A fruit with a distinctive scent."
//        }
//        """.data(using: .utf8)!
//
//        let decoder = JSONDecoder()
//        let product = try! decoder.decode(GroceryProduct.self, from: json)
//
//        print(product.name)
//        print(product.points)
//        print(product.description)