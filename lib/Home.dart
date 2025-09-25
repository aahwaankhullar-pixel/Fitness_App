import 'package:downsyndromeapp/Home.dart';
import 'package:downsyndromeapp/navbar.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final box = Hive.box("User");

  @override
  Widget build(BuildContext context) {
    String nickname= box.get("nickname");
    String avatar= box.get("avatar");
    return Scaffold(
      appBar: AppBar(
        title: Text("GroovAbility"),

      ),
      body: Container(
  child: Column(
    children: [
      Row(
        children: [
          Image.asset(avatar,width:100),
          SizedBox(width: 10,),
          Text("Hello $nickname")
        ],
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.greenAccent, width: 3),
          borderRadius: BorderRadius.circular(20),
        ),
        child:
        Row(
          children: [
            Text("Today's Goal"),
            SizedBox(width: 20,),
            Image.asset("assets/lion.2.png"),

          ]
        ),
      )
    ],

  ),

      ),

    );
  }
}