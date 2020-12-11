// Flutter
import 'dart:async';
import 'package:flutter/material.dart';

// Screens
import 'package:note_it/screens/login_screen.dart';

class Splash extends StatefulWidget {
  static const String id = 'splash';

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  // Splash start time
  start() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, authScreen); //duration ..., go to page ...
  }

  void authScreen() {
    //Navigator.of(context).pushReplacementNamed(LoginScreen.id);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return LoginScreen();
    }));
  }

  @override
  void initState() {
    super.initState();
    start();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: size.width / 3.5,
              ),
            ),
          ),
        );
      },
    );
  }
}
