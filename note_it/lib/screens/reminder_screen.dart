import 'package:flutter/material.dart';
import 'package:note_it/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReminderScreen extends StatefulWidget {
  static const String id = 'reminder_screen';

  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'assets/icons/notification.svg',
                color: primaryColor,
                width: 120.0,
              ),
              SizedBox(height: 22.0),
              Text(
                'Reminder is Empty',
                style: TextStyle(
                  color: secondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 23.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
