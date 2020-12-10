import 'package:flutter/material.dart';
import 'package:note_it/components/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TrashScreen extends StatefulWidget {
  static const String id = 'trash_screen';

  @override
  _TrashScreenState createState() => _TrashScreenState();
}

class _TrashScreenState extends State<TrashScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Empty trash screen
    Widget emptyTrash = Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assets/icons/trash.svg',
            color: primaryColor,
            width: 120.0,
          ),
          SizedBox(height: 22.0),
          Text(
            'Trash is Empty',
            style: TextStyle(
              color: secondaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 23.0,
            ),
          ),
        ],
      ),
    );

    return OrientationBuilder(
      builder: (context, orientation){
        return Scaffold(
          appBar: AppBar(
            title: Text('Trash'),
            centerTitle: true,
            backgroundColor: primaryColor,
          ),
          body: SafeArea(
            child: Container(
              child: emptyTrash,
            ),
          ),
        );
      },
    );
  }
}
