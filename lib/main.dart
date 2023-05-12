import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:park/pages/EditProfile.dart';
import 'package:park/pages/PagePrincipal.dart';
import 'package:park/components/ButtomCustom.dart';
import 'package:park/fini/RegistrationPage.dart';
import 'package:park/pages/SignIn.dart';
import 'package:park/pages/SignUp.dart';
import 'package:park/pages/WelcomePage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:park/pages/widget/small_text.dart';
import 'package:park/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      routes: {
        '/': (context)=> const SplashScreen(),
        '/SignIn': (context) => const SignIn(),
        '/SignUp': (context) => const SignUp(),
        '/home': (context) => const PagePrincipal()
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 15)).then((value) {
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (ctx) => const SignIn()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Center(
                child: SvgPicture.asset("assets/image/car.svg",
                    width: 120,
                  height: 120,
                  color: Colors.cyan,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SpinKitSpinningLines(
                color: Colors.cyan,
                size: 50.0,
              ),
              const SizedBox(
                height: 10,
              ),

              Container(
                padding: const EdgeInsets.only(top: 270),
                child: SmallText(text: " JoyPark version 1.0 Experimental"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
