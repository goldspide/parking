class UserModel{
  String? Nom;
  String? Prenom;
  String? NumeroDeTelephone;
  String? Email;
  String? Password;
  String? matricule;

  UserModel({this.Nom,this.Password,this.NumeroDeTelephone,this.Email,this.Prenom,this.matricule});

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['Nom'] = Nom;
    data['Prenom'] = Prenom;
    data['NumeroDeTelephone']=NumeroDeTelephone;
    data['Email']=Email;
    data['matricule']=matricule;
    data['Password']=Password;

    return data;
  }
}
