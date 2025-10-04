import "dart:async";


import "package:downsyndromeapp/PropExercises.dart";
import "package:downsyndromeapp/StartPage.dart";
import "package:downsyndromeapp/exercises.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:google_nav_bar/google_nav_bar.dart";
import "package:hive/hive.dart";

import "Home.dart";



class NavBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavBarState();
  }
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  final box=Hive.box("User");

  static List<Widget> _pages = <Widget>[
    Home(),
    Exercises(),
    PropExercises(),
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
    String avatar= box.get("avatar");
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),

          //borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
            //  topRight: Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10,10,10,20),
          child: GNav(
            gap: 8,
            activeColor: Colors.white,
            color: Colors.amber,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            duration: Duration(milliseconds: 800),
            tabBackgroundColor: Colors.orangeAccent,
            tabs: [
              GButton(icon: FontAwesomeIcons.houseChimney, text: 'Home',
                leading: Image.asset(
                  "assets/nav/house.png",
                  height: 25,
                  width: 25,
                ),
              ),
              GButton(icon: FontAwesomeIcons.dumbbell, text: 'Exercises',
                leading: Image.asset(
                  "assets/nav/biceps.png",
                  height: 25,
                  width: 25,
                ),
              ),
              GButton(
                icon: FontAwesomeIcons.tableTennisPaddleBall, text: 'Props',
                leading: Image.asset(
                  "assets/nav/tennis.png",
                  height: 25,
                  width: 25,
                ),
              ),
              GButton(icon: FontAwesomeIcons.calendarDays, text: "Tasks",
                leading: Image.asset(
                  "assets/nav/goal.png",
                  height: 25,
                  width: 25,
                ),
              ),
              GButton(icon: FontAwesomeIcons.user, text: "Profile",
                leading: Image.asset(
                  avatar,
                  height: 25,
                  width: 25,
                ),
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: _onItemTapped,
          ),
        ),
      ),
    );
  }
}