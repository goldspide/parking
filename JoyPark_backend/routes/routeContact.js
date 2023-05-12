const express = require('express');
const modelContact = require('../model/contact')
const app = express.Router();

app.post('/contact' ,async (req,res,next)=>{
    const contact = new modelContact(req.body);
    try{
        await contact.save();
        res.send(contact);

    }catch(error){
        res.status(500).send(error);
    }

});

app.get('/listecontact', async(req,res,next) => {
    const contact = new modelContact.find({});
    try{
        res.send(contact);
    }catch(error){
        res.status(500).send(error);
    }
});

app.patch('/contact/:id', async(req,res)=>{
    try{
        await modelContact.findByIdAndUpdate(req.params.id, req.body);
        await modelContact.save();
        res.send(contact);
    }catch (error){
        res.status(500).send(error);
    }
});

app.delete("/contact/:id", async (req,res)=>{
    try{
        const contact= await modelContact.findByIdAndDelete(req.params.id);

        if(!contact) res.status(404).send("contact introuvable");
        res.status(200).send();
    }catch(error){
        res.status(500).send(error);
    }
});
