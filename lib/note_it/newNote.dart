import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class newNote extends StatefulWidget {
  @override
  _newNoteState createState() => _newNoteState();
}

class _newNoteState extends State<newNote> {
  final title = new TextEditingController();
  final body = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          submit();
        },
        child: Icon(Icons.check),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80,
          color: Colors.black,
        ),
      ),
      backgroundColor: Color(0xff121212),
      appBar: AppBar(
        title: Text("Note It!"),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                    color: Colors.white),
                child: TextField(
                  controller: title,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Title',
                    labelStyle: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                    color: Colors.white),
                child: TextField(
                  maxLines: 10,
                  controller: body,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Add your notes here...',
                      labelStyle: TextStyle(fontSize: 20),
                      alignLabelWithHint: true),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  submit() async {
    await FirebaseFirestore.instance
        .collection('notes')
        .doc()
        .set({'title': title.text, 'body': body.text});
    Navigator.pop(context);
  }
}
