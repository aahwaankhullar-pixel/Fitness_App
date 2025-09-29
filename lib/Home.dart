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
        backgroundColor: Colors.lightBlueAccent,
        title: Text("GroovAbility"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Row(
              children: [
                Image.asset("assets/lion.2.png",width:50),
                SizedBox(width: 10,),
                Text("Hiiii, $nickname! 👋", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),)
              ],
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.greenAccent.shade100, width: 3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Flexible(
                    child: EasyRichText(
                      "Today's Goal\nComplete one exercise and reach 3000 steps! ",
                      defaultStyle: TextStyle(fontWeight: FontWeight.w500),
                      patternList: [
                        EasyRichTextPattern(
                          targetString: 'Today\'s Goal',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Image.asset(avatar, width: 100,),
                ]
              ),
            ),
            SizedBox(height:20),
            Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    width: MediaQuery.of(context).size.width/2-25,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.lightBlueAccent, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Column(
                      children: [
                        Text("👟",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text("Steps today",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text("2450",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        )


                      ],


                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    width: MediaQuery.of(context).size.width/2-25,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.pinkAccent, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Text("⭐",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text("200 points",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text("Level 1",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        )


                      ],


                    ),
                  )


                  ],





                )

          ],
        ),
      ),
    );
  }
}