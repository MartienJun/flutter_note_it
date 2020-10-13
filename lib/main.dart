import 'package:flutter/material.dart';
import 'inherited_note.dart';
import 'note_list.dart';

void main() => runApp(note_it());

//MAIN CONSTRUCTOR
class note_it extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InheritedNote(
      MaterialApp(
        title: 'Note It!',
        home: NoteList(),
      ),
    );
  }
}
