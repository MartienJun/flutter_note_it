// Flutter
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Firebase
import 'package:firebase_auth/firebase_auth.dart';

// Components
import 'package:note_it/components/constants.dart';
import 'package:note_it/components/navigation.dart';
import 'package:note_it/components/authentication.dart';

// Screens
import 'package:note_it/screens/register_screen.dart';
import 'package:note_it/utils/storage.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controller for Firebase query
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _fireauth = FirebaseAuth.instance;
  Storage _storage;

  @override
  void initState() {
    _storage = Storage();
    isAuthenticated().then((value) {
      if(value) Navigator.pushReplacementNamed(context, MyNavigation.id);
    });
    super.initState();
  }

  Future<bool> isAuthenticated() async {
    await _storage.init();
    return _storage.getUID() != null;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Email input field
    Widget EmailField = Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(0.0, 4.0),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: TextField(
        onChanged: null,
        controller: emailController,
        decoration: InputDecoration(
          labelText: 'Email',
          icon: Icon(
            Icons.account_circle,
            size: 24.0,
            color: secondaryColor,
          ),
          labelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
            color: secondaryColor,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );

    // Password input field
    Widget PasswordField = Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(0.0, 4.0),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: TextField(
        obscureText: true,
        onChanged: null,
        controller: passwordController,
        decoration: InputDecoration(
          labelText: 'Password',
          icon: Icon(
            Icons.lock,
            size: 24.0,
            color: secondaryColor,
          ),
          labelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
            color: secondaryColor,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );

    // Button sign in
    Widget ButtonSignIn = RaisedButton(
      padding: EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 40.0,
      ),
      color: Colors.white,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      splashColor: primaryColor.withOpacity(0.15),
      onPressed: () async {
        AuthenticationService(_fireauth);
        try {
          UserCredential result = await AuthenticationService.firebaseAuth
              .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

          if (result != null) {
            await _storage.setUID(result.user.uid);
            await _storage.setEmail(result.user.email);
            Navigator.pushReplacementNamed(context, MyNavigation.id);
            // TODO: Show the current user
            print(AuthenticationService.firebaseAuth.currentUser);
          }
        } on FirebaseAuthException catch (e) {
          print(e);
        }
      },
      child: Text(
        'SIGN IN',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14.0,
          color: primaryColor,
        ),
      ),
    );

    // Button sign up
    Widget ButtonSignUp = RaisedButton(
      padding: EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 40.0,
      ),
      color: secondaryColor,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      splashColor: primaryColor.withOpacity(0.15),
      onPressed: () {
        Navigator.pushNamed(context, RegisterScreen.id);
      },
      child: Text(
        'SIGN UP',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14.0,
          color: primaryColor,
        ),
      ),
    );

    // TODO: Edit this button letter or maybe for next update
    // Button Google
    Widget ButtonGoogle = InkWell(
      splashColor: Colors.white60,
      onTap: () {},
      child: Container(
          width: size.width,
          height: size.height / 15.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(0.0, 4.0),
                blurRadius: 8.0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/google.svg',
                width: 25.0,
              ),
              SizedBox(width: size.width / 30.0),
              Text(
                'Sign in with Google',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15.0,
                  color: secondaryColor,
                ),
              ),
            ],
          )),
    );

    // Slogan field
    Widget Slogan = Flexible(
      flex: 1,
      child: Container(
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 37.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Welcome to Note It!',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24.0,
                color: primaryColor,
                letterSpacing: 0.15,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Start writing now!',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
                color: Colors.black,
                letterSpacing: 0.15,
              ),
            ),
          ],
        ),
      ),
    );

    // Sign in field
    Widget signInField = Flexible(
      flex: 3,
      child: Container(
        width: size.width,
        padding: EdgeInsets.only(
          top: size.height / 11.0,
          left: size.width / 11.0,
          right: size.width / 11.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
          color: primaryColor,
        ),
        child: Column(
          children: <Widget>[
            EmailField,
            SizedBox(height: size.height / 21.0),
            PasswordField,
            SizedBox(height: 23.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Forget Your Password?',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0,
                  ),
                ),
                SizedBox(width: 10.0),
                //Edit this later
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Click Here',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12.0,
                      color: secondaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height / 21.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ButtonSignIn,
                ButtonSignUp,
              ],
            ),
            SizedBox(height: size.height / 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                  ),
                  width: size.width / 3.2,
                  height: size.height / 300.0,
                  color: secondaryColor,
                ),
                Text(
                  'OR',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                  ),
                  width: size.width / 3.2,
                  height: size.height / 300.0,
                  color: secondaryColor,
                ),
              ],
            ),
            SizedBox(height: size.height / 24.0),
            ButtonGoogle,
          ],
        ),
      ),
    );

    //print(AuthenticationService.firebaseAuth.currentUser);

    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          resizeToAvoidBottomPadding: false, //Sementara
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Slogan,
                signInField,
              ],
            ),
          ),
        );
      },
    );
  }
}
