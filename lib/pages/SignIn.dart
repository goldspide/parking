import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:park/class/user_model.dart';
import 'package:park/components/SignUpCustomAppBar.dart';
import 'package:park/components/custom_input_field.dart';
import 'package:park/components/screen_buttom.dart';
import 'package:park/constants/constants.dart';
import 'package:park/pages/PagePrincipal.dart';
import 'package:park/utils/colors.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';

// ignore: camel_case_types
class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

// ignore: camel_case_types
class _SignInState extends State<SignIn> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  bool isStape1 = true;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  UserModel userModel = UserModel();

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
            child: _SignIninUI(context),
          ),
        ),
      ),
    );
  }

  Widget _SignIninUI(BuildContext context) {
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
              "Connexion",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black,
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  FormHelper.inputFieldWidget(
                    context,
                    prefixIcon: Icon(Icons.person),
                    "Nom",
                    "Nom",
                    (onValidateVal) {
                      if (onValidateVal.isEmpty) {
                        return "le Nom est obligatoire";
                      }
                      return null;
                    },
                    (onSavedVal) {
                      this.userModel.Nom = onSavedVal;
                    },
                    initialValue: userModel.Nom ?? '',
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
                    prefixIcon: Icon(Icons.password),
                    "Password",
                    "Password",
                    (onValidateVal) {
                      if (onValidateVal.isEmpty) {
                        return "le mot de passe est obligatoire";
                      }
                      return null;
                    },
                    (onSavedVal) {
                      this.userModel.Password = onSavedVal;
                    },
                    initialValue: userModel.Password ?? '',
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
                    borderWidth: 0,
                    obscureText: hidePassword,
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
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: RichText(
                        text: TextSpan(
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                            ),
                            children: <TextSpan>[
                          TextSpan(
                              text: 'Mot de passe oublie ?',
                              style: const TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print("passe forgot");
                                })
                        ])),
                  ),
                ],
              )),

          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Center(
              child: FormHelper.submitButton(
                "connexion",
                () {

                  if (validateAndSave()) {
                    print(userModel.toJson());
                    const AlertDialog(

                        );
                  };
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => PagePrincipal()
                    ),
                  );
                },
                btnColor: primaryColor,
                borderColor: HexColor("50c2c9"),
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
                        text: "S'inscrire",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: HexColor("50c2c9"),
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, "/SignUp");
                          },
                      ),
                    ]),
              ),
            ),
          ),
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
