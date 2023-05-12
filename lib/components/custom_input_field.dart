import 'package:flutter/material.dart';
import 'package:park/constants/constants.dart';

// ignore: must_be_immutable
class CustomInputField extends StatefulWidget {
  CustomInputField(
      {Key? key,
      this.color = white,
      this.hintText = "",
      required this.controller,
      this.icon = Icons.import_contacts_sharp,
      this.iconColor = Colors.black})
      : super(key: key);
  Color color;
  String hintText;
  IconData icon;
  Color iconColor;
  final TextEditingController controller;
  @override
  State<CustomInputField> createState() =>
      // ignore: no_logic_in_create_state
      _CustomInputFieldState(controller, color, hintText, icon, iconColor);
}

class _CustomInputFieldState extends State<CustomInputField> {
  final Color color;
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final Color iconColor;

  _CustomInputFieldState(this.controller, this.color, this.hintText, this.icon, this.iconColor);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: color,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(96),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(96),
                borderSide: const BorderSide(
                  color: Colors.blue,
                )),
            prefixIcon: Icon(icon,color: iconColor,),
            // suffixIcon: Icon(icon,color: Colors.black),
            // suffixIcon: Icon(icon,color: iconColor,),
            hintText: hintText,
          )),
    );
  }
}
