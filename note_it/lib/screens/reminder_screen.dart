// Flutter
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Firebase
import 'package:cloud_firestore/cloud_firestore.dart';

// Components
import 'package:note_it/components/constants.dart';

// CRUD
import 'package:note_it/crud/reminder_crud.dart';
import 'package:note_it/crud/reminder_stream.dart';

class ReminderScreen extends StatefulWidget {
  static const String id = 'reminder_page';
  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    // Empty note screen
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

    // Note list
    Widget reminderList = ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        ReminderStream(firestore: _firestore),
      ],
    );

    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          body: SafeArea(
            child: reminderList,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, ReminderCRUD.id, arguments: null);
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return NoteCRUD();
              // }));
            },
            elevation: 1,
            backgroundColor: primaryColor,
            child: Icon(
              Icons.add,
              color: secondaryColor,
            ),
          ),
        );
      },
    );
  }
}

