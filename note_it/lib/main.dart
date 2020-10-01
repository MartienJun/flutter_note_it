import 'package:flutter/material.dart';
import 'package:note_it/screens/home_page.dart';

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

      ),

      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}
