import 'package:flutter/material.dart';

class ButtomCustom extends StatefulWidget {
  const ButtomCustom({Key? key}) : super(key: key);

  @override
  State<ButtomCustom> createState() => _ButtomCustomState();
}

class _ButtomCustomState extends State<ButtomCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3.5,
      decoration:const  BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.lightBlueAccent,
              // HexColor("50c2c9"),
              // HexColor("50c2c9"),
              // Colors.black,
            ],
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(100),
            bottomRight: Radius.circular(100),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "",
              width: 250,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
