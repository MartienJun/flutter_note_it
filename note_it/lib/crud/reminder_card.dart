// Flutter
import 'package:flutter/material.dart';

// Models
import 'package:note_it/models/reminder.dart';

// Components
import 'package:note_it/components/constants.dart';

class ReminderCard extends StatelessWidget {
  final Reminder reminder;
  final Function onPressed;

  ReminderCard({this.reminder, this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        margin: EdgeInsets.all(10.0),
        width: size.width,
        height: size.height / 8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(reminder.event),
            Text(reminder.time.toString()),
            Text(reminder.description)
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.16),
              offset: Offset(0.0, 2.0),
              blurRadius: 4.0,
            ),
          ],
        ),
      ),
    );
  }
}
