const mongoose = require('mongoose')
const bcrypt = require("bcrypt");

const UsersSchema = new mongoose.Schema({
    turns: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Turns',
    },
    name: {
        type: String,
        required: true,
    }, 
    lastName: {
        type: String,
        required: true,
    }, 
    province: {
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
    dni: {
        type: String,
        required: true,
    },
    dateOfBirth: {
        type: String,
        required: true,
    },
    email: {
        type: String,
        required: true,
        match: /.+@.+..+/,
        unique: true,
    },
    password: {
        type: String,
        required: true,
    },
    turns: [{ 
        type: mongoose.Schema.Types.ObjectId, 
        ref: 'Turns' 
    }],
    date: { 
        type: String, 
        default: new Date(), 
    },
});


UsersSchema.pre("save", function (next) {
  const user = this;
  if (this.isModified("password") || this.isNew) {
    bcrypt.genSalt(10, function (saltError, salt) {
      if (saltError) return next(saltError);
      else {
        bcrypt.hash(user.password, salt, function (hashError, hash) {
          if (hashError) return next(hashError);
          user.password = hash;
          next();
        });
      }
    });
  } else return next();
});


const Users = mongoose.model('Users', UsersSchema);

module.exports = Users
