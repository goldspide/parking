import 'package:flutter/material.dart';
import 'package:park/pages/EditProfile.dart';
import 'package:park/pages/PagePrincipal.dart';
import 'package:park/pages/widget/big_text.dart';
import 'package:park/pages/widget/small_text.dart';
import 'package:park/utils/colors.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class SignUpCustomButtom extends StatefulWidget {
  const SignUpCustomButtom({Key? key}) : super(key: key);

  @override
  State<SignUpCustomButtom> createState() => _SignUpCustomButtomState();
}

class _SignUpCustomButtomState extends State<SignUpCustomButtom> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.pureColor.withOpacity(0.7),
                AppColors.pureColor.withOpacity(0.7),
              ],
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(60),
              bottomRight: Radius.circular(60),
            ),
          ),
          child: const ClipRRect(
            borderRadius:  BorderRadius.only(bottomLeft:Radius.circular(60),bottomRight: Radius.circular(60)) ,
            child: Image(
              image: AssetImage("assets/image/parkinggar.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
