import 'package:flutter/material.dart';
import 'inherited_note.dart';
import 'note.dart';

//NOTE TITLE CLASS
class _NoteTitle extends StatelessWidget {
  final String _title;

  _NoteTitle(this._title);

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

//NOTE CONTENT CLASS
class _NoteContent extends StatelessWidget {
  final String _content;

  _NoteContent(this._content);

  @override
  Widget build(BuildContext context) {
    return Text(
      _content,
      style: TextStyle(color: Colors.grey.shade500),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

//NOTE LIST CLASS
class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  List<Map<String, String>> get _notes => InheritedNote.of(context).notes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note It!'),
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Note(NoteMode.Edit, index)));
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 30.0, bottom: 30.0, left: 15.0, right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _NoteTitle(_notes[index]['title']),
                      Container(height: 3, width: 3),
                      _NoteContent(_notes[index]['content'])
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: _notes.length),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) => Note(NoteMode.Add, null)));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}