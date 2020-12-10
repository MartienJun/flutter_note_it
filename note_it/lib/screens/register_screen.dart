import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note_it/components/constants.dart';

// Screens
import 'package:note_it/components/navigation.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'register_screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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

    // Button register
    Widget ButtonRegister = InkWell(
      splashColor: Colors.white60,
      onTap: () {
        Navigator.pushReplacementNamed(context, MyNavigation.id);
      },
      child: Container(
        width: size.width,
        height: size.height / 15.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: secondaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0.0, 4.0),
              blurRadius: 8.0,
            ),
          ],
        ),
        child: Center(
          child: Text(
            'SIGN ME UP',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15.0,
              color: primaryColor,
            ),
          ),
        ),
      ),
    );

    // TODO: Edit this button letter or maybe for next update
    // Register with Google
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

    // SLogan field
    Widget slogan = Flexible(
      flex: 1,
      child: Container(
        width: size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Note It! Never Forget',
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
      ),
    );

    // Register field
    Widget registerField = Flexible(
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
            SizedBox(height: size.height / 21.0),
            ButtonRegister,
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

    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          resizeToAvoidBottomPadding: false, //Sementara
          body: SafeArea(
            child: Column(
              children: [
                slogan,
                registerField,
              ],
            ),
          ),
        );
      },
    );
  }
}
