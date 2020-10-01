import 'package:flutter/material.dart';
import 'package:note_it/screens/home_screen.dart';
import 'package:note_it/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note It!',
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),

      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}
