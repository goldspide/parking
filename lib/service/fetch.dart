import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:park/class/user_model.dart';

class Api {
  static getUser() async {
    List <UserModel> utilisateurs = [];
    final url = 'http://192.168.43.62:3806';
    final registration = url + '/inscription';
    final reservation = url + 'reservation';
    final utilisateur = url + '/utilisateur';
    try{
      final res = await http.get(Uri.parse(utilisateur));

      if (res.statusCode == 200){
        var data = jsonDecode(res.body);
        data['utilisateur'].forEach(
            (value) => {
              utilisateurs.add(
                UserModel(Nom:value['nom'],Prenom:value['prenom'],Email:value['email']),
              ),
            },

        );
        return utilisateurs;
        print(data);

      }else{

      }

    }catch(e){
      print(e.toString());

    }
  }
}