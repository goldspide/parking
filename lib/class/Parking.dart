class Parking{
  String? Nom;
  String? latitude;
  String? longitude;
  String? type;
  DateTime? heureOuverture;
  DateTime? heureFermeture;

  Parking({this.Nom,this.heureFermeture,this.heureOuverture,this.latitude,this.longitude,this.type});

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['Nom'] = Nom;
    data['latitude'] = latitude;
    data['longitude']= longitude;
    data['type']=type;
    data['heureOuverture']= heureOuverture;
    data['heureFermeture'] = heureFermeture;
    return data;
  }

}