import 'package:flutter/material.dart';

// Components
import 'package:note_it/components/navigation.dart';

// Screens
import 'package:note_it/screens/splash.dart';
import 'package:note_it/screens/login_screen.dart';
import 'package:note_it/screens/home_screen.dart';
import 'package:note_it/screens/reminder_screen.dart';
import 'package:note_it/screens/user_screen.dart';
import 'package:note_it/screens/settings_screen.dart';
import 'package:note_it/screens/editNote_screen.dart';
import 'package:note_it/screens/category_screen.dart';
import 'package:note_it/screens/trash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'Note It!',
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),

      //InitialRoute, the first page to be displayed
      initialRoute: Splash.id,

      //Route to another pages
      routes: {
        Splash.id: (context) => Splash(),
        LoginScreen.id: (context) => LoginScreen(),
        MyNavigation.id: (context) => MyNavigation(),
        HomeScreen.id: (context) => HomeScreen(),
        ReminderScreen.id: (context) => ReminderScreen(),
        UserScreen.id: (context) => UserScreen(),
        EditNote.id: (context) => EditNote(),
        CategoryScreen.id: (context) => CategoryScreen(),
        TrashScreen.id: (context) => TrashScreen(),
        SettingsScreen.id: (context) => SettingsScreen(),
      },
    );
  }
}