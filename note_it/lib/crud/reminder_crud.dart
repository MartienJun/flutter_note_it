// Flutter
import 'package:flutter/material.dart';

// Firebase
import 'package:cloud_firestore/cloud_firestore.dart';

// Models
import 'package:note_it/models/reminder.dart';

// Components
import 'package:note_it/components/constants.dart';
import 'package:note_it/components/authentication.dart';
import 'package:intl/intl.dart';

class ReminderCRUD extends StatefulWidget {
  static const String id = 'crud_reminder';

  @override
  _ReminderCRUDState createState() => _ReminderCRUDState();
}

class _ReminderCRUDState extends State<ReminderCRUD> {
  Reminder reminder;

  String eventString = '';
  String descriptionString = '';
  String timeString = '';

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TextEditingController controllerEvent;
  TextEditingController controllerDescription;
  TextEditingController controllerTime;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);

    reminder = ModalRoute.of(context).settings.arguments;
    if (reminder != null) {
      eventString = reminder.event;
      descriptionString = reminder.description;
      timeString = reminder.time.toString();
    }

    controllerEvent =
        TextEditingController(text: reminder != null ? reminder.event : '');
    controllerDescription = TextEditingController(
        text: reminder != null ? reminder.description : '');
    controllerTime =
        TextEditingController(text: reminder != null ? reminder.time : '');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          reminder != null ? 'Edit Reminder' : 'Add Reminder',
          style: TextStyle(
            color: secondaryColor,
            fontWeight: FontWeight.w700,
            fontSize: 24.0,
            letterSpacing: 0.0,
          ),
        ),
        iconTheme: IconThemeData(
          color: secondaryColor,
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.save,
            ),
            onPressed: () {
              saveClicked();
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
            ),
            onPressed: () {
              _firestore
                  .collection('notes')
                  .doc(AuthenticationService.firebaseAuth.currentUser.uid)
                  .collection('reminder')
                  .doc(reminder.id)
                  .delete();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(marginL),
              child: TextField(
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
                controller: controllerEvent,
                //textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Event...',
                ),
                onChanged: (value) {
                  eventString = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(marginL),
              child: TextFormField(
                style: TextStyle(fontWeight: FontWeight.w500),
                controller: controllerTime,
                textAlign: TextAlign.start,
                decoration: InputDecoration(hintText: 'YYYY-MM-DD'),
                onChanged: (value) {
                  timeString = value;
                },
              ),
            ),
            SizedBox(
              height: marginS,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(marginL),
                child: TextField(
                  controller: controllerDescription,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(hintText: 'Event description...'),
                  onChanged: (value) {
                    descriptionString = value;
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void saveClicked() {
    if (reminder == null) {
      _firestore
          .collection('notes')
          .doc(AuthenticationService.firebaseAuth.currentUser.uid)
          .collection('reminder')
          .add({
        'event': eventString,
        'time': timeString,
        'description': descriptionString,
      });
    } else {
      _firestore
          .collection('notes')
          .doc(AuthenticationService.firebaseAuth.currentUser.uid)
          .collection('reminder')
          .doc(reminder.id)
          .update({
        'event': eventString,
        'time': timeString,
        'description': descriptionString,
      });
    }
  }
}
