import 'package:flutter/material.dart';
class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text("promax") ,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Commencer"),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
