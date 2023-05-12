const express = require('express');
const modelParking = require('../model/parking');
const app = express.Router();

app.post('/parking' ,async (req,res,next)=>{
    const parking = new modelParking(req.body);
    try{
        await parking.save();
        res.send(parking);

    }catch(error){
        res.status(500).send(error);
    }

});

app.get('/listeparking', async(req,res,next) => {
    const parking = new modelParking.find({});
    try{
        res.send(parking);
    }catch(error){
        res.status(500).send(error);
    }
});

app.patch('/parking/:id', async(req,res)=>{
    try{
        await modelParking.findByIdAndUpdate(req.params.id, req.body);
        await modelParking.save();
        res.send(parking);
    }catch (error){
        res.status(500).send(error);
    }
});

app.delete("/parking/:id", async (req,res)=>{
    try{
        const parking= await modelParking.findByIdAndDelete(req.params.id);

        if(!parking) res.status(404).send("parking introuvable");
        res.status(200).send();
    }catch(error){
        res.status(500).send(error);
    }
});

module.exports = app