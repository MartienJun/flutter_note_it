// Flutter
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Firebase
import 'package:cloud_firestore/cloud_firestore.dart';

// Components
import 'package:note_it/components/constants.dart';

// CRUD
import 'package:note_it/crud/note_crud.dart';
import 'package:note_it/crud/note_stream.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_page';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    // Empty note screen
    Widget emptyNote = Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assets/icons/writing.svg',
            color: primaryColor,
            width: 120.0,
          ),
          SizedBox(height: 22.0),
          Text(
            'Note is Empty',
            style: TextStyle(
              color: secondaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 23.0,
            ),
          ),
        ],
      ),
    );

    // Note
    Widget note = Container(
      margin: EdgeInsets.all(10.0),
      width: size.width,
      height: size.height / 4.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey,
      ),
    );

    // Note list
    Widget noteList = ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        NotesStream(firestore: _firestore),
      ],
    );

    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          body: SafeArea(
            child: noteList,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, NoteCRUD.id, arguments: null);
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return NoteCRUD();
              // }));
            },
            elevation: 1,
            backgroundColor: primaryColor,
            child: Icon(
              Icons.add,
              color: secondaryColor,
            ),
          ),
        );
      },
    );
  }
}
