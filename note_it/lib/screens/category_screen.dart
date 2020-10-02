import 'package:flutter/material.dart';
import 'package:note_it/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryScreen extends StatefulWidget {
  static const String id = 'category_screen';

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          'assets/icons/menu.svg',
          color: primaryColor,
          width: 120.0,
        ),
      ),
    );
  }
}
