import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:park/class/user_model.dart';
import 'package:park/components/SignUpCustomAppBar.dart';
import 'package:park/configIP.dart';
import 'package:park/constants/constants.dart';
import 'package:park/utils/colors.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:http/http.dart' as http;
import 'Contact.dart';

// ignore: camel_case_types
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

// ignore: camel_case_types
class _SignUpState extends State<SignUp> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  bool isStape1 = true;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  UserModel userModel = UserModel();



  void registerUser(Map data) async {
    print(data);

      var RegisterBody = {
        'nom': userModel.Nom,
        'prenom': userModel.Prenom,
        'email': userModel.Email,
        'Telephone': userModel.NumeroDeTelephone,
        'matricule': userModel.matricule,
        'password': userModel.Password

      };
      try {
        var response = await http.post(Uri.parse(registration),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(RegisterBody)
        );
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body.toString());
          print(data);
          print("information envoye avec success!!!!");

        } else {
          print('failed to get response');

        }
        print(response.statusCode);
      }catch(e){
        debugPrint(e.toString());
      };


  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#E5E5E5"),
        body: ProgressHUD(
          inAsyncCall: isAPIcallProcess,
          opacity: 0.3,
          key: UniqueKey(),
          child: Form(
            key: globalKey,
            child: _loginUI(context),
          ),
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SignUpCustomButtom(),
          // const CustomNavBar(),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              bottom: 30,
              top: 25,
            ),
            child: Text(
              "Registration",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black,
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: isStape1
                  ? Column(
                      children: [
                        FormHelper.inputFieldWidget(
                          context,
                          prefixIcon: const Icon(Icons.person),
                          "Nom",
                          "Nom",
                          (onValidateVal) {
                            if (onValidateVal.isEmpty) {
                              return "le Nom est obligatoire";
                            }
                            return null;
                          },
                          (onSavedVal) {
                            this.userModel.Nom= onSavedVal;
                          },
                          borderFocusColor: AppColors.pureColor,
                          prefixIconColor: Colors.black,
                          borderColor: Colors.white,
                          hintColor: Colors.black.withOpacity(0.5),
                          textColor: Colors.black,
                          backgroundColor: Colors.white,
                          paddingLeft: 0,
                          paddingRight: 0,
                          paddingBottom: 0,
                          paddingTop: 0,
                          borderWidth: 50,
                          showPrefixIcon: true,
                            onChange: (value){
                              this.userModel.Nom = value;
                              print('**************************************************************');
                              print(userModel.Nom);
                            }
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FormHelper.inputFieldWidget(
                          context,
                          prefixIcon: const Icon(Icons.person),
                          "Prenom",
                          "Prenom",
                          (onValidateVal) {
                            if (onValidateVal.isEmpty) {
                              return "le Prenom est obligatoire";
                            }
                            return null;
                          },
                          (onSavedVal) {
                            this.userModel.Prenom = onSavedVal;
                          },
                          borderFocusColor: AppColors.pureColor,
                          prefixIconColor: Colors.black,
                          borderColor: Colors.white,
                          hintColor: Colors.black.withOpacity(0.5),
                          textColor: Colors.black,
                          backgroundColor: Colors.white,
                          paddingLeft: 0,
                          paddingRight: 0,
                          paddingBottom: 0,
                          paddingTop: 0,
                          borderWidth: 50,
                          showPrefixIcon: true,
                            onChange: (value){
                              this.userModel.Prenom = value;
                              print('**************************************************************');
                              print(userModel.Prenom);
                            }
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FormHelper.inputFieldWidget(
                          context,
                          prefixIcon: const Icon(Icons.phone),
                          "Telephone",
                          "Telephone",
                          (onValidateVal) {
                            if (onValidateVal.isEmpty) {
                              return "le Telephone est obligatoire";
                            }
                            return null;
                          },
                          (onSavedVal) {
                            this.userModel.NumeroDeTelephone = onSavedVal;
                          },
                          borderFocusColor: AppColors.pureColor,
                          prefixIconColor: Colors.black,
                          borderColor: Colors.white,
                          hintColor: Colors.black.withOpacity(0.5),
                          textColor: Colors.black,
                          backgroundColor: Colors.white,
                          paddingLeft: 0,
                          paddingRight: 0,
                          paddingBottom: 0,
                          paddingTop: 0,
                          borderWidth: 50,
                          showPrefixIcon: true,
                            onChange: (value){
                              this.userModel.NumeroDeTelephone = value;
                              print('**************************************************************');
                              print(userModel.NumeroDeTelephone);
                            }
                        ),
                      ],
                    )
                  : Container(
                      child: Column(
                        children: [
                          FormHelper.inputFieldWidget(
                            context,
                            prefixIcon: const Icon(Icons.mail),
                            "Email",
                            "Email",
                            (onValidateVal) {
                              if (onValidateVal.isEmpty) {
                                return "l'Email est obligatoire";
                              }
                              return null;
                            },
                            (onSavedVal) {
                              this.userModel.Email = onSavedVal;
                            },
                            borderFocusColor: AppColors.pureColor,
                            prefixIconColor: Colors.black,
                            borderColor: Colors.white,
                            hintColor: Colors.black.withOpacity(0.5),
                            textColor: Colors.black,
                            backgroundColor: Colors.white,
                            paddingLeft: 0,
                            paddingRight: 0,
                            paddingBottom: 0,
                            paddingTop: 0,
                            borderWidth: 50,
                            showPrefixIcon: true,
                              onChange: (value){
                                this.userModel.Email = value;
                                print('**************************************************************');
                                print(userModel.Email);
                              }
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FormHelper.inputFieldWidget(
                            context,
                            prefixIcon: const Icon(Icons.margin_sharp),
                            "Matricule du vehicule",
                            "Entre le matricule de votre vehicule",
                                (onValidateVal) {
                              if (onValidateVal.isEmpty) {
                                return "le matricule du vehicule est obligatoire";
                              }
                              return null;
                            },
                                (onSavedVal) {
                              this.userModel.matricule = onSavedVal;
                            },
                            borderFocusColor: AppColors.pureColor,
                            prefixIconColor: Colors.black,
                            borderColor: Colors.white,
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
                          const SizedBox(
                            height: 10,
                          ),
                          FormHelper.inputFieldWidget(
                            context,
                            prefixIcon: const Icon(Icons.password),
                            "Mot de Passe",
                            "Mot de Passe",
                            (onValidateVal) {
                              if (onValidateVal.isEmpty) {
                                return "le mot de passe  est obligatoire";
                              }
                              return null;
                            },
                            (onSavedVal) {
                              this.userModel.Password = onSavedVal;
                            },
                            borderFocusColor: AppColors.pureColor,
                            prefixIconColor: Colors.black,
                            borderColor: Colors.white,
                            hintColor: Colors.black.withOpacity(0.5),
                            textColor: Colors.black,
                            backgroundColor: Colors.white,
                            obscureText: hidePassword,
                            paddingLeft: 0,
                            paddingRight: 0,
                            paddingBottom: 0,
                            paddingTop: 0,
                            borderWidth: 50,
                            showPrefixIcon: true,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              color: Colors.black,
                              icon: Icon(hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                              onChange: (value){
                                this.userModel.Password= value;
                                print('**************************************************************');
                                print(userModel.Password);
                              }
                          ),
                        ],
                      ),
                    )),

          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Center(
              child: FormHelper.submitButton(
                isStape1 ? "Next" : "S'inscrire",
                () {
                  if (isStape1) {
                    setState(() {
                      isStape1 = false;
                    });
                  } else {
                if(validateAndSave()){
                  registerUser(userModel.toJson());
                  // print((userModel.toJson()));
                  // print(LineAwesomeIcons.user.toString());
                }
                  }
                },
                btnColor: primaryColor,
                borderColor: AppColors.pureColor,
                txtColor: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(right: 2, top: 2),
                child: RichText(
                  text: TextSpan(
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                      ),
                      children: <TextSpan>[
                        const TextSpan(text: "Avez vous un compte?"),
                        TextSpan(
                          text: 'se connecte',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.pureColor,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, "/SignIn");
                            },
                        ),
                      ]),
                ),
              )),
        ],
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
