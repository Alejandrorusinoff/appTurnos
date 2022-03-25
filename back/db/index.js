const mongoose = require('mongoose')

const uri = {
    urlAtlas: "mongodb+srv://admin:123@appturnos.5wwfo.mongodb.net/appTurnos?retryWrites=true&w=majority"
}


mongoose.connect(uri.urlAtlas, { useNewUrlParser: true, useUnifiedTopology: true })

module.exports = mongoose