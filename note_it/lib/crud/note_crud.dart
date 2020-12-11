// Flutter
import 'package:flutter/material.dart';

// Firebase
import 'package:cloud_firestore/cloud_firestore.dart';

// Models
import 'package:note_it/models/note.dart';

// Components
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
  String noteType = '';

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TextEditingController controllerTitle;
  TextEditingController controllerNote;
  TextEditingController controllerType;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    note = ModalRoute
        .of(context)
        .settings
        .arguments;
    if (note != null) {
      titleString = note.title;
      noteString = note.note;
      noteType = note.type;
    }

    controllerTitle =
        TextEditingController(text: note != null ? note.title : '');
    controllerNote = TextEditingController(text: note != null ? note.note : '');
    controllerType = TextEditingController(text: note != null ? note.type : '');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          note != null ? 'Edit Note' : 'Add Note',
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
                  .collection('notes')
                  .doc(note.id)
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
                controller: controllerTitle,
                //textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Note title...',
                ),
                onChanged: (value) {
                  titleString = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(marginL),
              child: TextField(
                controller: controllerType,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: 'Note category...',
                ),
                onChanged: (value) {
                  noteType = value;
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
          .add({'title': titleString, 'note': noteString, 'type': noteType});
    } else {
      _firestore
          .collection('notes')
          .doc(AuthenticationService.firebaseAuth.currentUser.uid)
          .collection('notes')
          .doc(note.id)
          .update({'title': titleString, 'note': noteString, 'type': noteType});
    }
  }
}
