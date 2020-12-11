// Flutter
import 'package:flutter/material.dart';

// Models
import 'package:note_it/models/note.dart';

// Components
import 'package:note_it/components/constants.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final Function onPressed;

  NoteCard({this.note, this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        margin: EdgeInsets.all(10.0),
        width: size.width,
        height: size.height / 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(note.title),
            Text(note.type),
            Text(note.note)
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
