const mongoose = require('mongoose')

const TurnsSchema = new mongoose.Schema({
    userId: { 
        type: mongoose.Schema.Types.ObjectId, 
        ref: 'User' 
    },
    specialist: {
        type: String,
        required: true,
    }, 
    turnDateandTime: {
        type: String,
        required: true,
    },
    additionalInformation: {
        type: String,
        required: true,
    }, 
    location: {
        type: String,
        required: true,
    },
    direction: {
        type: String,
        required: true,
    },
    date: { 
        type: String, 
        default: new Date(), 
    },
});

const Turns = mongoose.model('Turns', TurnsSchema);

module.exports = Turns
