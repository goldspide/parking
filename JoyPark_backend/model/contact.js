const mongoose = require('mongoose');

const schemaContact = new mongoose.Schema({
    nomParking:{
        type:String,
    },
    
    numeroTelephone: {
        type: String,
    },
    numeroWhatApp:{
        type: String
    }

})

const contact = mongoose.model('contact',schemaContact);

module.exports = contact;