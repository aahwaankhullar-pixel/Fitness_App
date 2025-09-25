import "dart:async";


import "package:downsyndromeapp/StartPage.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:google_nav_bar/google_nav_bar.dart";

import "Home.dart";



class NavBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavBarState();
  }
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;


  static List<Widget> _pages = <Widget>[
    StartPage(),
    Home(),
    Home(),
    Home(),
    Home(),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),

          //borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
            //  topRight: Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: GNav(
            gap: 8,
            activeColor: Colors.white,
            color: Colors.amber,
            iconSize: 28,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            duration: Duration(milliseconds: 800),
            tabBackgroundColor: Colors.orangeAccent,
            tabs: [
              GButton(icon: FontAwesomeIcons.houseChimney, text: 'Home'),
              GButton(icon: FontAwesomeIcons.dumbbell, text: 'Exercises'),
              GButton(
                  icon: FontAwesomeIcons.tableTennisPaddleBall, text: 'Props'),
              GButton(icon: FontAwesomeIcons.calendarDays, text: "Tasks"),
              GButton(icon: FontAwesomeIcons.user, text: "Profile"),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: _onItemTapped,
          ),
        ),
      ),
    );
  }


}