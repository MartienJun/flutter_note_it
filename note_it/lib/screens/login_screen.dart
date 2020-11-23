import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note_it/constants.dart';
import 'package:note_it/components/navigation.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    //Email Input Field
    Widget EmailField = Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
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
            size: 24,
            color: secondaryColor,
          ),
          labelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: secondaryColor,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );

    //Password Input Field
    Widget PasswordField = Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
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
            size: 24,
            color: secondaryColor,
          ),
          labelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: secondaryColor,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );

    //Button Sign In
    Widget ButtonSignIn = RaisedButton(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 40,
      ),
      color: Colors.white,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      splashColor: primaryColor.withOpacity(0.15),
      onPressed: () {
        Navigator.pushReplacementNamed(context, MyNavigation.id);
      },
      child: Text(
        'SIGN IN',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14,
          color: primaryColor,
        ),
      ),
    );

    //Button Sign Up
    Widget ButtonSignUp = RaisedButton(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 40,
      ),
      color: secondaryColor,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      splashColor: primaryColor.withOpacity(0.15),
      onPressed: () {},
      child: Text(
        'SIGN UP',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14,
          color: primaryColor,
        ),
      ),
    );

    //Button Google
    Widget ButtonGoogle = InkWell(
      splashColor: Colors.white60,
      onTap: (){},
      child: Container(
          width: size.width,
          height: size.height / 15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
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
                width: 25,
              ),
              SizedBox(width: size.width / 30,),
              Text(
                'Sign in with Google',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: secondaryColor,
                ),
              ),
            ],
          )
      ),
    );

    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          resizeToAvoidBottomPadding: false, //Sementara
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Container(
                    width: size.width,
                    padding: EdgeInsets.symmetric(horizontal: 37),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Welcome to Note It!',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: primaryColor,
                            letterSpacing: 0.15,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Start writing now!',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black,
                            letterSpacing: 0.15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    width: size.width,
                    padding: EdgeInsets.only(
                      top: size.height / 11,
                      left: size.width / 11,
                      right: size.width / 11,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                      color: primaryColor,
                    ),
                    child: Column(
                      children: <Widget>[
                        EmailField,
                        SizedBox(height: 30),
                        PasswordField,
                        SizedBox(height: 23),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Forget Your Password?',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(width: 10),
                            //Edit this later
                            Text(
                              'Click Here',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: secondaryColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            ButtonSignIn,
                            ButtonSignUp,
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              width: size.width / 3.2,
                              height: size.height / 300,
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
                                left: 10,
                                right: 10,
                              ),
                              width: size.width / 3.2,
                              height: size.height / 300,
                              color: secondaryColor,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ButtonGoogle,
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
