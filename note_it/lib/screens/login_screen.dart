import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_it/constants.dart';
import 'package:note_it/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Image.asset(
                'assets/images/logo.png',
                width: 102.0,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(
                  top: 100,
                  right: 40,
                  left: 40,
                ),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35.0),
                    topLeft: Radius.circular(35.0),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: TextField(
                        onChanged: null,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: fontColorGray,
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: TextField(
                        obscureText: true,
                        onChanged: null,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: fontColorGray,
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    RaisedButton(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 13,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, HomeScreen.id);
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
