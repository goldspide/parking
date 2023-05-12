const mongoose = require('mongoose');

const schemaParking = new mongoose.Schema({
    nomParrking: {
        type:String,
        require:true
    },
    localisation:{
        type:Array,
        require:true
    },
    nombreDePlace:{
        type:Number,
    },
    horaire:{
        type:Array
    },
    typeDeParking:{
        type:Array
    },
    date:{
        type:Date,
        default:Date.now
    }

})

const parking = mongoose.model('parking',schemaParking);
module.exports = parking;