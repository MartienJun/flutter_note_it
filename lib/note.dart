import 'package:flutter/material.dart';

import 'inherited_note.dart';

enum NoteMode { Add, Edit }

//BUTTON CLASS
class _NoteButton extends StatelessWidget {
  final String _text;
  final Color _color;
  final Function _onPressed;

  _NoteButton(this._text, this._color, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: _onPressed,
      child: Text(
        _text,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      minWidth: 100,
      color: _color,
      height: 50,
    );
  }
}

/*
MAIN CLASS
==========
 */
class Note extends StatefulWidget {
  final NoteMode noteMode;
  final int noteIndex;

  Note(this.noteMode, this.noteIndex);

  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  List<Map<String, String>> get _notes => InheritedNote.of(context).notes;

  @override
  void didChangeDependencies() {
    if(widget.noteMode == NoteMode.Edit){
      _titleController.text = _notes[widget.noteIndex]['title'];
      _contentController.text = _notes[widget.noteIndex]['content'];
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.noteMode == NoteMode.Add ? 'Add Note' : 'Edit Note'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(hintText: 'Title'),
            ),
            Container(height: 8),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(hintText: 'Add your notes here'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _NoteButton('Save', Colors.blueAccent, () {
                    final newTitle = _titleController.text;
                    final newContent = _contentController.text;

                    if (widget.noteMode == NoteMode.Add) {
                      _notes.add({'title': newTitle, 'content': newContent});
                    } else if (widget.noteMode == NoteMode.Edit) {
                      _notes[widget.noteIndex] = {
                        'title': newTitle,
                        'content': newContent
                      };
                    }
                    Navigator.pop(context);
                  }),
                  _NoteButton('Discard', Colors.grey, () {
                    Navigator.pop(context);
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
