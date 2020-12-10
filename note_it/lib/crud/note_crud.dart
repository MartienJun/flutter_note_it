import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:note_it/models/note.dart';
import 'package:note_it/components/constants.dart';
import 'package:note_it/components/authentication.dart';

class NoteCRUD extends StatefulWidget {
  static const String id = 'crud_screen';

  @override
  _NoteCRUDState createState() => _NoteCRUDState();
}

class _NoteCRUDState extends State<NoteCRUD> {
  Note note;

  String titleString = '';
  String noteString = '';

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TextEditingController controllerTitle;
  TextEditingController controllerNote;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    note = ModalRoute.of(context).settings.arguments;
    if (note != null) {
      titleString = note.title;
      noteString = note.note;
    }

    controllerTitle =
        TextEditingController(text: note != null ? note.title : '');
    controllerNote = TextEditingController(text: note != null ? note.note : '');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          note != null ? 'Edit note' : 'Add note',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.save,
              color: Colors.white,
            ),
            onPressed: () {
              saveClicked();
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
            onPressed: () {
              _firestore.collection('notes').doc(note.id).delete();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: marginS),
              child: TextField(
                controller: controllerTitle,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Note title...',
                ),
                onChanged: (value) {
                  titleString = value;
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
                  controller: controllerNote,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(hintText: 'Note content...'),
                  onChanged: (value) {
                    noteString = value;
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
    if (note == null) {
      _firestore
          .collection('notes')
          .doc(AuthenticationService.firebaseAuth.currentUser.uid)
          .collection('notes')
          .add({'title': titleString, 'note': noteString});
    } else {
      _firestore
          .collection('notes')
          .doc(AuthenticationService.firebaseAuth.currentUser.uid)
          .collection('notes')
          .doc(note.id)
          .update({'title': titleString, 'note': noteString});
    }
  }
}
