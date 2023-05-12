const express = require('express');
const app = express();
const mongoose= require('mongoose');
const user = require('./routes/routeUtilisateur');
const ticket = require('./routes/routeTicket');
const contact = require('./routes/routeContact');
const parking = require('./routes/routeParking');
const reservation =  require('./routes/routeReservation');

app.use(express.json());
app.use(express.urlencoded({
    extended: true
}));

// appal des different route pour les execute(route principal)
app.use(user);
app.use(reservation);
// app.use(ticket);
// app.use(contact);
app.use(parking);
// app.use(reservation);


// initialisation de la base de donnees
mongoose.connect(
    'mongodb://localhost:27017/joyPark',
    {
        useNewUrlParser: true,
        useUnifiedTopology:true
    }
);

// appele des fonction particuliere est avance



const registerData = [];

app.listen(3803,() => console.log('Serveur connecte avec success'));

//post api

// app.post('/registration',(req,res) =>{
//     console.log('result', req.body);
//     const data = {
//         'nom': req.body.nom,
//         'prenom': req.body.prenom,
//         'email': req.body.email,
//         'Telephone': req.body.telephone,
//         'password': req.body.password
//     };

//     registerData.push(data);
//     console.log('final',data);

//     res.status(200).send({
//         'status_code': 200,
//         'message': 'User addes successfully',
//         'user': data
// });
// })