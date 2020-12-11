// Flutter
import 'package:flutter/material.dart';

// Firebase
import 'package:firebase_core/firebase_core.dart';

// Components
import 'package:note_it/components/navigation.dart';

// Screens
import 'package:note_it/screens/splash.dart';
import 'package:note_it/screens/user_screen.dart';
import 'package:note_it/screens/home_screen.dart';
import 'package:note_it/screens/login_screen.dart';
import 'package:note_it/screens/trash_screen.dart';
import 'package:note_it/screens/register_screen.dart';
import 'package:note_it/screens/reminder_screen.dart';
import 'package:note_it/screens/settings_screen.dart';
import 'package:note_it/screens/category_screen.dart';

// CRUD
import 'package:note_it/crud/note_crud.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        RegisterScreen.id: (context) => RegisterScreen(),
        MyNavigation.id: (context) => MyNavigation(),
        HomeScreen.id: (context) => HomeScreen(),
        ReminderScreen.id: (context) => ReminderScreen(),
        UserScreen.id: (context) => UserScreen(),
        CategoryScreen.id: (context) => CategoryScreen(),
        TrashScreen.id: (context) => TrashScreen(),
        SettingsScreen.id: (context) => SettingsScreen(),
        NoteCRUD.id: (context) => NoteCRUD(),
      },
    );
  }
}