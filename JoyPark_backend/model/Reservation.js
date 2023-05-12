const mongoose = require('mongoose');

const schemaReservation = new mongoose.Schema({
    nom:{
        type:String,
        require:true
    },
    heureArrive:{
        type:Date
    },
    heureDepart:{
        type:Date
    },
    date:{
        type:Date,
        default: Date.now
    },
    etat:{
        type:Boolean,
        default:false
    },
    chrono:{
        type:Date
    },
    duree:{
        type:Number
    },
    localisation:{
        type:Array,
    },
    image:{
        type:String,
    }
})

const reservation = mongoose.model('reservation',schemaReservation);

module.exports = reservation;