import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//Note It
import 'package:note_it/constants.dart';
import 'package:note_it/screens/home_screen.dart';
import 'package:note_it/screens/reminder_screen.dart';
//import 'package:note_it/screens/category_screen.dart';
//import 'package:note_it/screens/trash_screen.dart';
import 'package:note_it/screens/user_screen.dart';

class MyNavigation extends StatefulWidget {
  static const String id = 'my_navigation';

  @override
  _MyNavigationState createState() => _MyNavigationState();
}

class _MyNavigationState extends State<MyNavigation> {
  PageController _pageController = PageController();

  //List of Screen
  List<Widget> _screens = [
    HomeScreen(),
    ReminderScreen(),
    UserScreen(),
  ];

  int _selectedIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    print(_selectedIndex);
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        /*
          Is a controller for PageView, that lets you manipulate which page
          is visible in a PageView.  PageController also lets you control the
          offset in terms of pages, which are increments of the viewport size.
        */
        children: _screens,
        onPageChanged: _onPageChanged,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        elevation: 1,
        backgroundColor: primaryColor,
        child: Icon(
          Icons.add,
          //color: secondaryColor,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primaryColor,
        currentIndex: _selectedIndex,
        //If i tapped, then ...
        onTap: _onItemTapped,
        //List of Item (Screens)
        items: [
          //Index 0
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/writing.svg',
              width: 30,
              color: _selectedIndex == 0 ? secondaryColor : Colors.white,
            ),
            title: Text(
              'Note',
              style: TextStyle(
                color: _selectedIndex == 0 ? secondaryColor : Colors.white,
                fontWeight:
                    _selectedIndex == 0 ? FontWeight.w700 : FontWeight.w400,
              ),
            ),
            backgroundColor: primaryColor,
          ),
          //Index 1
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/notification.svg',
              width: 30,
              color: _selectedIndex == 1 ? secondaryColor : Colors.white,
            ),
            title: Text(
              'Reminder',
              style: TextStyle(
                color: _selectedIndex == 1 ? secondaryColor : Colors.white,
                fontWeight:
                    _selectedIndex == 1 ? FontWeight.w700 : FontWeight.w400,
              ),
            ),
            backgroundColor: primaryColor,
          ),
          //Index 2
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/user.svg',
              width: 20,
              color: _selectedIndex == 2 ? secondaryColor : Colors.white,
            ),
            title: Text(
              'User',
              style: TextStyle(
                color: _selectedIndex == 2 ? secondaryColor : Colors.white,
                fontWeight:
                _selectedIndex == 2 ? FontWeight.w700 : FontWeight.w400,
              ),
            ),
            backgroundColor: primaryColor,
          ),
        ],
      ),
    );
  }
}
