const LocalStrategy = require('passport-local').Strategy
const bcrypt = require('bcrypt');

function initialize(passport){
    const authenticateUser = async (nom,password,done) =>{
        const user = getUserBynom(nom)
        if(nom == null){
            return done(null,false,{message:"Aucun utilisteur a ce nom"})
        }
        try {
            if(await bcrypt.compare(password, user.password)){
                return done(null,user)
            }else{
                return done(null,false,{message:'nom Incorrect'})
            }
            
        } catch (error) {
            console.log(error);
            return done(error);
            
        }
    }
passport.use(new LocalStrategy({usernameField: 'nom'},authenticateUser))
passport.serializeUser((user,done)=> {return done(null,getUserBynom(nom)) })
passport.serializeUser((user,done)=>{
    return done(null,getUserBynom(nom))
})

}
module.exports = initialize;