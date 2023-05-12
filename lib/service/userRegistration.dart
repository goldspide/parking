// import 'package:park/class/user_model.dart';
// import 'package:http/http.dart' as http;
//
// UserModel userModel = UserModel();
// void registerUser(Map data) async {
//   print(data);
//   if (this.userModel.Nom!.isNotEmpty) {
//     setState(() {
//     });
//   } else {
//
//     var RegisterBody = {
//       'nom': userModel.Nom,
//       'prenom': userModel.Prenom,
//       'email': userModel.Email,
//       'Telephone': userModel.NumeroDeTelephone,
//       'password': userModel.Password
//     };
//     try {
//       var response = await http.post(Uri.parse(registration),
//           headers: {"Content-Type": "application/json"},
//           body: jsonEncode(RegisterBody)
//       );
//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body.toString());
//         print(data);
//
//       } else {
//         print('failed to get response');
//
//       }
//       print(response);
//     }catch(e){
//       debugPrint(e.toString());
//     };
//
//   }
// }
//
// void setState(Null Function() param0) {
// }
