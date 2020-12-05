import 'package:flutter/material.dart';
import 'package:note_it/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserScreen extends StatefulWidget {
  static const String id = 'user_screen';

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(13, 35, 13, 0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('assets/images/profile.png'),
                      width: size.width / 2.7,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Hi, User',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: secondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 55.0),
              //Button 1
              InkWell(
                onTap: (){},
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
              ),
              SizedBox(height: 20.0),
              //Button 2
              InkWell(
                onTap: (){},
                child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
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
              ),
              SizedBox(height: 20.0),
              //Button 3
              InkWell(
                onTap: (){},
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
