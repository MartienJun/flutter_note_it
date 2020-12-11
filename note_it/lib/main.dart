// Flutter
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:note_it/components/authentication.dart';

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
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   //debugShowCheckedModeBanner: false,
    //   title: 'Note It!',
    //   theme: ThemeData(
    //     fontFamily: 'Montserrat',
    //   ),
    //   home: AuthWrapper(),
    //   //InitialRoute, the first page to be displayed
    //   //initialRoute: Splash.id,
    //
    //   //Route to another pages
    //   // routes: {
    //   //   Splash.id: (context) => Splash(),
    //   //   LoginScreen.id: (context) => LoginScreen(),
    //   //   RegisterScreen.id: (context) => RegisterScreen(),
    //   //   MyNavigation.id: (context) => MyNavigation(),
    //   //   HomeScreen.id: (context) => HomeScreen(),
    //   //   ReminderScreen.id: (context) => ReminderScreen(),
    //   //   UserScreen.id: (context) => UserScreen(),
    //   //   CategoryScreen.id: (context) => CategoryScreen(),
    //   //   TrashScreen.id: (context) => TrashScreen(),
    //   //   SettingsScreen.id: (context) => SettingsScreen(),
    //   //   NoteCRUD.id: (context) => NoteCRUD(),
    //   // },
    // );

    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationService>().authStateChanges,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Note It!',
        theme: ThemeData(
          fontFamily: 'Montserrat',
        ),
        home: AuthWrapper(),
        routes: {
          NoteCRUD.id: (context) => NoteCRUD(),
        },
      ),
    );
  }
}

class AuthWrapper extends StatefulWidget {
  //static const String id = 'auth_wrapper';

  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if(firebaseUser != null) {
      return MyNavigation();
    } else {
      return LoginScreen();
    }

    return Container(
      child: Text('Test'),
    );
  }
}
