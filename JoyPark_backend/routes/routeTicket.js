const express = require('express');
const modelTicket = require('../model/ticket');
const ticket = require('../model/ticket');
const app = express.Router();

app.post('/ticket' ,async (req,res,next)=>{
    const ticket = new modelTicket(req.body);
    try{
        await ticket.save();
        res.send(ticket);

    }catch(error){
        res.status(500).send(error);
    }

});

app.get('/listeticket', async(req,res,next) => {
    const ticket = new modelTicket.find({});
    try{
        res.send(ticket);
    }catch(error){
        res.status(500).send(error);
    }
});


app.patch('/mettreAjour/ticket/:id', async(req,res)=>{
    try{
        await modelTicket.findByIdAndUpdate(req.params.id, req.body);
        await modelTicket.save();
        res.send(ticket);
    }catch (error){
        res.status(500).send(error);
    }
});

app.delete("/supprimer/ticket/:id", async (req,res)=>{
    try{
        const ticket= await modelTicket.findByIdAndDelete(req.params.id);

        if(!ticket) res.status(404).send("ticket introuvable");
        res.status(200).send();
    }catch(error){
        res.status(500).send(error);
    }
});
