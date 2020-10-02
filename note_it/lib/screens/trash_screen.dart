import 'package:flutter/material.dart';
import 'package:note_it/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TrashScreen extends StatefulWidget {
  static const String id = 'trash_screen';

  @override
  _TrashScreenState createState() => _TrashScreenState();
}

class _TrashScreenState extends State<TrashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          'assets/icons/trash.svg',
          color: primaryColor,
          width: 120.0,
        ),
      ),
    );
  }
}
