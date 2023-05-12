import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:park/class/reservation_model.dart';
import 'package:park/components/screen_buttom1.dart';
import 'package:park/configIP.dart';
import 'package:park/constants/constants.dart';
import 'package:park/pages/PagePrincipal.dart';
import 'package:park/pages/widget/big_text.dart';
import 'package:park/utils/colors.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:http/http.dart' as http;

class Reservation extends StatefulWidget {
  const Reservation({Key? key}) : super(key: key);

  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  ReservationModel reservationModel = ReservationModel();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  void registerUser(Map data) async {
    print(data);
    if (this.reservationModel.nomParking!.isNotEmpty) {
      setState(() {
      });
    } else {

      var RegisterBody = {
        'nomParking': reservationModel.nomParking,
        'idPlace': reservationModel.idPlace,
        'matricule': reservationModel.matricule,
        'darereservation': reservationModel.datereservation,
        'heureArrive': reservationModel.heureArrive,
        'heureDepart': reservationModel.heuredepart,
      };
      try {
        var response = await http.post(Uri.parse(reservation),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(RegisterBody)
        );
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body.toString());
          print(data);

        } else {
          print('failed to get response');

        }
        print(response);
      }catch(e){
        debugPrint(e.toString());
      };

    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Stack(
              children: [
                const CallButtom(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      margin: const EdgeInsets.only(top: 150),
                      child: BigText(text: "Reservation", color: Colors.white)),
                ),
              ],
            ),
           const SizedBox(
              height: 30,
            ),

            Container(
              margin: EdgeInsets.only(left: 15,right: 15),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all()),
              child: DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  showSelectedItems: true,
                  disabledItemFn: (String s) => s.startsWith('I'),
                ),
                items: const ["Parking Confiance", "Italia (Disabled)", "PARKING KOTTO CARREFOUR DES IMMEUBLES", 'Parking communal payant','Bonabéri Car Parking','Parking Bolloré'],
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: "Nom de Parking",
                    hintText: "Selectionne un parking",
                  ),
                ),
                onChanged: print,
                selectedItem: "Parking Bolloré",
              ),
            ),

            // DropdownSearch<String>.multiSelection(
            //   items: const ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
            //   popupProps: PopupPropsMultiSelection.menu(
            //     showSelectedItems: true,
            //     disabledItemFn: (String s) => s.startsWith('I'),
            //   ),
            //   onChanged: print,
            //   selectedItems: ["Brazil"],
            // ),


            const SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 10,right: 10),
              child: Column(
                children: [
                  // FormHelper.inputFieldWidget(
                  //   context,
                  //   prefixIcon: Icon(Icons.person),
                  //   "NomParking",
                  //   "NomParking",
                  //       (onValidateVal) {
                  //     if (onValidateVal.isEmpty) {
                  //       return "le Nom est obligatoire";
                  //     }
                  //     return null;
                  //   },
                  //       (onSavedVal) {
                  //     this.reservationModel.nomParking = onSavedVal;
                  //   },
                  //   initialValue: reservationModel.nomParking ?? '',
                  //   borderFocusColor: AppColors.pureColor,
                  //   prefixIconColor: Colors.black,
                  //   borderColor: Colors.black,
                  //   hintColor: Colors.black.withOpacity(0.5),
                  //   textColor: Colors.black,
                  //   backgroundColor: Colors.white,
                  //   paddingLeft: 0,
                  //   paddingRight: 0,
                  //   paddingBottom: 0,
                  //   paddingTop: 0,
                  //   borderWidth: 50,
                  //   showPrefixIcon: true,
                  //
                  // ),
                  const SizedBox(
                    height: 10,
                  ),

                  // FormHelper.inputFieldWidget(
                  //   context,
                  //   prefixIcon:const Icon(Icons.person),
                  //   "IdPlace",
                  //   "IdPlace",
                  //       (onValidateVal) {
                  //     if (onValidateVal.isEmpty) {
                  //       return "le Matricule est obligatoire";
                  //     }
                  //     return null;
                  //   },
                  //       (onSavedVal) {
                  //     this.reservationModel.idPlace = onSavedVal;
                  //   },
                  //   initialValue: reservationModel.idPlace ?? '',
                  //   borderFocusColor: AppColors.pureColor,
                  //   prefixIconColor: Colors.black,
                  //   borderColor: Colors.black,
                  //   hintColor: Colors.black.withOpacity(0.5),
                  //   textColor: Colors.black,
                  //   backgroundColor: Colors.white,
                  //   paddingLeft: 0,
                  //   paddingRight: 0,
                  //   paddingBottom: 0,
                  //   paddingTop: 0,
                  //   borderWidth: 50,
                  //   showPrefixIcon: true,
                  // ),

                  const SizedBox(
                    height: 10,
                  ),

                  FormHelper.inputFieldWidget(
                    context,
                    prefixIcon:const Icon(Icons.person),
                    "Matricule",
                    "Matricule",
                        (onValidateVal) {
                      if (onValidateVal.isEmpty) {
                        return "le Matricule est obligatoire";
                      }
                      return null;
                    },
                        (onSavedVal) {
                      this.reservationModel.matricule = onSavedVal;
                    },
                    initialValue: reservationModel.matricule ?? '',
                    borderFocusColor: AppColors.pureColor,
                    prefixIconColor: Colors.black,
                    borderColor: Colors.black,
                    hintColor: Colors.black.withOpacity(0.5),
                    textColor: Colors.black,
                    backgroundColor: Colors.white,
                    paddingLeft: 0,
                    paddingRight: 0,
                    paddingBottom: 0,
                    paddingTop: 0,
                    borderWidth: 50,
                    showPrefixIcon: true,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Center(
                      child: FormHelper.submitButton(
                        "reserve",
                            () {
                              if(validateAndSave()){
                                registerUser(reservationModel.toJson());
                                print((reservationModel.toJson()));
                                print(LineAwesomeIcons.user.toString());

                                showDialog(context: context, builder: (context) => AlertDialog(
                                  title:  const Text('information sur la reservation'),
                                  content:  Text('Demande Envoye'),
                                  actions: [
                                    TextButton(onPressed: () {
                                      Navigator.pop(context);
                                    }, child: Text('quite'))
                                  ],
                                )
                                );
                              }
                              print("yoooooo");
                        },
                        btnColor: primaryColor,
                        borderColor: HexColor("50c2c9"),
                        txtColor: Colors.white,
                      ),
                    ),
                  ),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }else
    {
      return false;
    }
  }
}
