class ReservationModel {
  String? nomParking;
  String? idPlace;
  String? matricule;
  DateTime? heureArrive;
  DateTime? heuredepart;
  DateTime? datereservation;

  ReservationModel({this.matricule,this.datereservation,this.heuredepart,this.heureArrive,this.idPlace,this.nomParking});

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String,dynamic>();

    data['nomParking'] = nomParking;
    data['idPlace'] = idPlace;
    data['matricule'] = matricule;
    data['heureArrive'] = heureArrive;
    data['heuredepart'] = heuredepart;
    data['dateReservation'] = datereservation;
    return data;

  }
}
