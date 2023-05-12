const express = require('express');
const modelReservation = require('../model/Reservation');
const reservation = require('../model/Reservation');
const app = express.Router();
app.post('/reservation' ,async (req,res,next)=>{
    const reservation = new modelReservation(req.body);
    try{
        await reservation.save();
        res.send(reservation);

    }catch(error){
        res.status(500).send(error);
    }

});

app.get('/listeReservation', async(req,res,next) => {
    const reservation = new modelReservation.find({});
    try{
        res.send(reservation);
    }catch(error){
        res.status(500).send(error);
    }
});

app.patch('/reservation/:id', async(req,res)=>{
    try{
        await modelReservation.findByIdAndUpdate(req.params.id, req.body);
        await modelReservation.save();
        res.send(reservation);
    }catch (error){
        res.status(500).send(error);
    }
});

app.delete("/reservation/:id", async (req,res)=>{
    try{
        const reservation= await modelReservation.findByIdAndDelete(req.params.id);

        if(!reservation) res.status(404).send("reservation introuvable");
        res.status(200).send();
    }catch(error){
        res.status(500).send(error);
    }
});

module.exports = app;

