// Flutter
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Components
import 'package:note_it/components/constants.dart';

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
            'Trash is under construction',
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
              child: emptyTrash,
            ),
          ),
        );
      },
    );
  }
}
