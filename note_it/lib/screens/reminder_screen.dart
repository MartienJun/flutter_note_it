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
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          'assets/icons/notification.svg',
          color: primaryColor,
          width: 120.0,
        ),
      ),
    );
  }
}
