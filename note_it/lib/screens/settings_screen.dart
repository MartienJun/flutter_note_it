// Flutter
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Components
import 'package:note_it/components/constants.dart';

class SettingsScreen extends StatefulWidget {
  static const String id = 'settings_screen';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Empty settings screen
    Widget emptySettings = Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assets/icons/settings.svg',
            color: primaryColor,
            width: 120.0,
          ),
          SizedBox(height: 22.0),
          Text(
            'Setting is under construction',
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
            title: Text('Settings'),
            centerTitle: true,
            backgroundColor: primaryColor,
          ),
          body: SafeArea(
            child: Container(
              child: emptySettings,
            ),
          ),
        );
      },
    );
  }
}
