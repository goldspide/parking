const mongoose = require('mongoose');

const schemaUtilisateur = new mongoose.Schema({
    nom:{
        type:String,
        require: true,
        unique:true
    },
    prenom:{
        type:String,
        require:true,
    },
    email: {
        type:String,
        require:true,
        unique:true
    },
    telephone:{
        type:String,
        require:true
    },
    motDePasse:{
        type:String,
        require:true
    },
    matricule:{
        type:String,
        required:true
    },
    image:{
        type:String,
        default: '/home/joyboy/Downloads/download/photo',
    },
    solde:{
            type:Number,
            default:0
   }
    
});

schemaUtilisateur.statics.findUser = async(nom,motDePasse) =>{
    const name = await utilisateur.findOne({nom});
    if(!name) throw new Error('Error, pas possible de se connecter!');

    const password =  await compaire(motDePasse,name.motDePasse)
    if(!password) throw new Error('Error, pas possible de se connecte');
    return name;
};



const utilisateur = mongoose.model('utilisateur',schemaUtilisateur);

module.exports = utilisateur;