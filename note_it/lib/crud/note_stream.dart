import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:note_it/models/note.dart';
import 'package:note_it/crud/note_crud.dart';
import 'package:note_it/crud/note_card.dart';
import 'package:note_it/components/constants.dart';
import 'package:note_it/components/authentication.dart';

class NotesStream extends StatelessWidget {
  final FirebaseFirestore _firestore;

  NotesStream({firestore}) : _firestore = firestore;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore
          .collection('notes')
          .doc(AuthenticationService.firebaseAuth.currentUser.uid)
          .collection('notes')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator(
            backgroundColor: primaryColor,
          );
        }
        final notes = snapshot.data.documents;
        List<NoteCard> noteCards = [];
        for (var note in notes) {
          Note noteObject = Note(
              id: note.documentID, title: note['title'], note: note['note']);
          noteCards.add(NoteCard(
            note: noteObject,
            onPressed: () {
              Navigator.pushNamed(context, NoteCRUD.id, arguments: noteObject);
            },
          ));
        }

        return Column(
          children: noteCards,
        );
      },
    );
  }
}
