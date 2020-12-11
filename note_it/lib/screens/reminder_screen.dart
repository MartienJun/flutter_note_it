// Flutter
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Components
import 'package:note_it/components/constants.dart';

class ReminderScreen extends StatefulWidget {
  static const String id = 'reminder_screen';

  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Empty reminder screen
    Widget emptyReminder = Container(
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
    );

    // Reminder
    Widget reminder = Container(
      margin: EdgeInsets.all(10.0),
      width: size.width,
      height: size.height / 4.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey,
      ),
    );

    // Reminder list
    Widget noteList = ListView(
      scrollDirection: Axis.vertical,
      children: [
        reminder,
      ],
    );

    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          body: SafeArea(
            child: emptyReminder,
          ),
        );
      },
    );
  }
}
