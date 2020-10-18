import 'package:flutter/material.dart';

//NoteIt Assets
import 'package:note_it/components/navigation.dart';
import 'package:note_it/screens/home_screen.dart';
import 'package:note_it/screens/login_screen.dart';
import 'package:note_it/screens/reminder_screen.dart';
import 'package:note_it/screens/category_screen.dart';
import 'package:note_it/screens/settings_screen.dart';
import 'package:note_it/screens/trash_screen.dart';
import 'package:note_it/screens/user_screen.dart';
import 'package:note_it/screens/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Note It!',
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),

      //InitialRoute, the first page to be displayed
      initialRoute: Splash.id,

      //Route to another pages
      routes: {
        Splash.id: (context) => Splash(),
        MyNavigation.id: (context) => MyNavigation(),
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        ReminderScreen.id: (context) => ReminderScreen(),
        CategoryScreen.id: (context) => CategoryScreen(),
        TrashScreen.id: (context) => TrashScreen(),
        SettingsScreen.id: (context) => SettingsScreen(),
        UserScreen.id: (context) => UserScreen(),
      },
    );
  }
}
