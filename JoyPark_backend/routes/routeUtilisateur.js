// if (process.env.NODE_ENV !=='production'){
//     require('dotenv').config()
// }

const express = require("express");
const modelUtilisateur = require("../model/utilisateur");
const utilisateur = require("../model/utilisateur");
const app = express.Router();
// const bcrypt = require('bcrypt');
// const passport = require('passport');
// const initializePassport = require('./passportConfgi')
// const session = require('express-session')

// const users = [];

// initializePassport(
//     passport,
//     nom => users.find(users =>users.nom == nom),
//     id => users.find(users=>users.id ===id)
// );
// app.use(session({
//     secret: process.env.SESSION_SECRET,
//     resave:false,
//     saveUninitialized:false
// }))

// app.use(passport.initialize());
// app.use(passport.session)

// app.post('/inscription', async (req,res,next)=>{

//     try {
//         const hidePassword = await bcrypt.hash(req.body.password,10);
//         users.push({
//             id:Date.now().toString(),
//             nom: req.body.nom,
//             prenom:req.body.prenom,
//             email:req.body.email,
//             numerodetelephone:req.body.numerodetelephone,
//             password:hidePassword

//         })
//         console.log(users);
//         res.redirect('/SignIn')

//     } catch (error) {
//         console.log(error);
//         res.redirect('/SignUp')

//     }
// })

// app.post('/login',passport.authenticate('local',{
//     successRedirect: '/home',
//     failureRedirect:'/SignIn'
// }))

app.post("/inscriptions", async (req, res, next) => {
  const utilisateur = new modelUtilisateur(req.body);
  try {
    await utilisateur.save();

    let utilisateurId = await this.createQueryBuilder("utilisateur")
      .select("utilisateur.nom")
      .where("utilisateur.email = :query", { query: req.body.email })
      .getOne();

    console.log("tilisateurId");

    // res.send(utilisateur);
    return res.send("fsdfsdfsdfsdfsdfs")
    // res.status(200).send({
    //   statusCode: 200,
    //   message: "Utilisateur enregistre avec success",
    //   Utilisateur: utilisateur,
    // });
  } catch (error) {
    res.status(501).send(error);
  }
});

app.post("/utilisateur/login", async (req, res, next) => {
  try {
    const utilisateur = await modelUtilisateur.findUser(
      req.body.nom,
      req.body.password
    );
    return res.send(utilisateur);
  } catch (error) {
    res.status(500).send(error);
  }
});

app.get("/utilisateur", async (req, res, next) => {
  try {
    const utilisateur = await modelUtilisateur.find({});
    return res.status(200).send({
      status_code: 200,
      utilisateurs: utilisateur,
    });
  } catch (error) {
    res.status(501).send(error);
  }
});

app.patch("/utilisateur/:id", async (req, res) => {
  try {
    await modelUtilisateur.findByIdAndUpdate(req.params.id, req.body);
    await modelUtilisateur.save();
    return res.send(utilisateur);
  } catch (error) {
    res.status(500).send(error);
  }
});

app.delete("/utilisateur/:id", async (req, res) => {
  try {
    const utilisateur = await modelUtilisateur.findByIdAndDelete(req.params.id);

    if (!utilisateur) res.status(404).send("utilisateur introuvable");
    res.status(200).send();
  } catch (error) {
    res.status(500).send(error);
  }
});

module.exports = app;
