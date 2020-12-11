// Flutter
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_it/components/authentication.dart';

// Components
import 'package:note_it/components/constants.dart';
import 'package:note_it/crud/note_stream.dart';

class CategoryScreen extends StatefulWidget {
  static const String id = 'category_screen';

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Empty category screen
    Widget emptyCategory = Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assets/icons/menu.svg',
            color: primaryColor,
            width: 120.0,
          ),
          SizedBox(height: 22.0),
          Text(
            'Category is Empty',
            style: TextStyle(
              color: secondaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 23.0,
            ),
          ),
        ],
      ),
    );

    Widget ListCategory = StreamBuilder(
      stream: _fireStore
          .collection('notes')
          .doc(AuthenticationService.firebaseAuth.currentUser.uid)
          .collection('notes')
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: primaryColor,
            ),
          );
        }
        return ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 12.0),
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(document.data()['type'].toString()),
            );
          }).toList(),
        );
      },
    );

    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Trash',
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
            backgroundColor: primaryColor,
          ),
          body: SafeArea(
            child: Container(
              child: ListCategory,
            ),
          ),
        );
      },
    );
  }
}