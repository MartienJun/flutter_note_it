import 'package:flutter/material.dart';
import 'package:note_it/components/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditNote extends StatefulWidget {
  static const String id = 'editNote_screen';

  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            title: Text(
              'Note Titile Here',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Container(),
          ),
        );
      },
    );
  }
}
