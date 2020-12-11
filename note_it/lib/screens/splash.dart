// Flutter
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:note_it/components/authentication.dart';
import 'package:note_it/screens/home_screen.dart';

// Screens
import 'package:note_it/screens/login_screen.dart';

class Splash extends StatefulWidget {
  static const String id = 'splash';

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    start();
  }

  // Splash start time
  start() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, () =>
        Navigator.of(context).pushReplacementNamed(LoginScreen.id)); //duration ..., go to page ...
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