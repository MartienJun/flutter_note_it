// Flutter
import 'package:flutter/material.dart';

// Firebase
import 'package:cloud_firestore/cloud_firestore.dart';

// Models
import 'package:note_it/models/reminder.dart';

// CRUD
import 'package:note_it/crud/reminder_crud.dart';
import 'package:note_it/crud/reminder_card.dart';

// Components
import 'package:note_it/components/constants.dart';
import 'package:note_it/components/authentication.dart';

class ReminderStream extends StatelessWidget {
  final FirebaseFirestore _firestore;

  ReminderStream({firestore}) : _firestore = firestore;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore
          .collection('notes')
          .doc(AuthenticationService.firebaseAuth.currentUser.uid)
          .collection('reminder')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator(
            backgroundColor: primaryColor,
          );
        }
        final reminders = snapshot.data.documents;
        List<ReminderCard> reminderCards = [];
        for (var reminder in reminders) {
          Reminder reminderObject = Reminder(
              id: reminder.documentID,
              event: reminder['event'],
              time: reminder['time'],
              description: reminder['description'],
              );
          reminderCards.add(ReminderCard(
            reminder: reminderObject,
            onPressed: () {
              Navigator.pushNamed(context, ReminderCRUD.id,
                  arguments: reminderObject);
            },
          ));
        }

        return Column(
          children: reminderCards,
        );
      },
    );
  }
}
