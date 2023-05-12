const mongoose = require('mongoose');
const reservation = require('./Reservation');

const schemaTicket = new mongoose.Schema({
    ticket:{
        type:String
    }
})
const ticket = mongoose.model('ticket',schemaTicket);

module.exports = ticket;