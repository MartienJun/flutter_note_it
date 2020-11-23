import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:note_it/logins/authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'newNote.dart';

class notes extends StatefulWidget {
  @override
  _notesState createState() => _notesState();
}

class _notesState extends State<notes> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xff18203d),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(65, 85, 76, 1.0),
        foregroundColor: Colors.white,
        splashColor: Colors.white,
        onPressed: () {
          transport(newNote());
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.blueGrey,
          height: 100,
          child: RaisedButton(
            onPressed: () {
              context.read<AuthenticationService>().signOut();
            },
            child: Text(
              "Sign out",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Note It!"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('notes').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError)
            return new Text('Error: ${snapshot.error}',
                style: TextStyle(color: Colors.white));
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');
            default:
              return new ListView(
                children: snapshot.data.docs.map((DocumentSnapshot document) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 100,
                      child: Card(
                        color: Colors.blueGrey,
                        child: new ListTile(
                          title: new Text(document['title'],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold)),
                          subtitle: new Text(document['body'],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0)),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
          }
        },
      ),
    );
  }

  transport(Widget n) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => n));
  }
}
