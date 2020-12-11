// Flutter
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Components
import 'package:note_it/components/constants.dart';
import 'package:note_it/components/authentication.dart';

// Screens
import 'package:note_it/screens/login_screen.dart';
import 'package:note_it/screens/trash_screen.dart';
import 'package:note_it/screens/category_screen.dart';
import 'package:note_it/screens/settings_screen.dart';

class UserScreen extends StatefulWidget {
  static const String id = 'user_screen';

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // User profile
    Widget UserData = Column(
      children: [
        Image(
          image: AssetImage('assets/images/profile.png'), // Default picture
          width: size.width / 2.7,
        ),
        SizedBox(height: 10.0),
        Text(
          'Hi, ' + AuthenticationService.firebaseAuth.currentUser.email,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: secondaryColor,
          ),
        ),
      ],
    );

    // Button sign out
    Widget ButtonSignOut = RaisedButton(
      padding: EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 40.0,
      ),
      color: primaryColor,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      splashColor: primaryColor.withOpacity(0.15),
      onPressed: () {
        AuthenticationService.firebaseAuth.signOut();
        //Navigator.pushReplacementNamed(context, LoginScreen.id);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return LoginScreen();
        }));
      },
      child: Text(
        'SIGN OUT',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14.0,
          color: secondaryColor,
        ),
      ),
    );

    // Button category
    Widget ButtonCategory = InkWell(
      onTap: () {
        //Navigator.pushNamed(context, CategoryScreen.id);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CategoryScreen();
        }));
      },
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.16),
                offset: Offset(0.0, 2.0),
                blurRadius: 4.0,
              ),
            ],
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/menu.svg',
                width: 25.0,
                color: secondaryColor,
              ),
              SizedBox(width: 20.0),
              Text(
                'Category',
                style: TextStyle(
                  color: secondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 19.0,
                ),
              ),
            ],
          )),
    );

    // Button trash
    Widget ButtonTrash = InkWell(
      onTap: () {
        //Navigator.pushNamed(context, TrashScreen.id);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return TrashScreen();
        }));
      },
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.16),
                offset: Offset(0.0, 2.0),
                blurRadius: 4.0,
              ),
            ],
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/trash.svg',
                width: 25.0,
                color: secondaryColor,
              ),
              SizedBox(width: 20.0),
              Text(
                'Trash',
                style: TextStyle(
                  color: secondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 19.0,
                ),
              ),
            ],
          )),
    );

    // Button settings
    Widget ButtonSetting = InkWell(
      onTap: () {
        //Navigator.pushNamed(context, SettingsScreen.id);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SettingsScreen();
        }));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.16),
              offset: Offset(0.0, 2.0),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/settings.svg',
              width: 25.0,
              color: secondaryColor,
            ),
            SizedBox(width: 20.0),
            Text(
              'Settings',
              style: TextStyle(
                color: secondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
              ),
            ),
          ],
        ),
      ),
    );

    return OrientationBuilder(builder: (context, orientation) {
      return Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.fromLTRB(13.0, 35.0, 13.0, 0.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: UserData,
                ),
                SizedBox(height: 55.0),
                ButtonCategory,
                SizedBox(height: 20.0),
                ButtonTrash,
                SizedBox(height: 20.0),
                ButtonSetting,
                SizedBox(height: 55.0),
                Center(
                  child: ButtonSignOut,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
