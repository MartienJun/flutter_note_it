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
        margin: EdgeInsets.all(10.0),
        width: size.width,
        height: size.height / 4,
        child: ListTile(
          title: Text(note.title),
          subtitle: Text(note.note),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: ColorGray, offset: Offset(0, 10), blurRadius: 5.0)
          ],
        ),
      ),
    );
  }
}
