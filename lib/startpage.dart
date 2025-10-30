import 'dart:math';

import 'package:downsyndromeapp/User.dart';
import 'package:downsyndromeapp/avatarpage.dart';
import 'package:downsyndromeapp/signup.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

import 'achievements_db.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final box=Hive.box("User");

  List<Map<String, dynamic>> weekly_challenges= [];

  Map<String, dynamic> today_challenge= {};
  List<Map<String, dynamic>> bonus_challenges= [];
  final random = Random();

  TextEditingController nicknamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Get status bar height to add padding
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFFF8E1), // very light amber
            Color(0xFFFFE0B2), // light orangish
            Color(0xFFFFCDD2), // very light pinkish
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, // Make scaffold background transparent
        extendBodyBehindAppBar: true, // Extend body behind app bar
        appBar: AppBar(
          backgroundColor: Colors.transparent, // Make app bar transparent
          elevation: 0, // Remove shadow
          systemOverlayStyle: SystemUiOverlayStyle.dark, // Set status bar icon brightness (optional)
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, statusBarHeight + kToolbarHeight + 20, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/lion.2.png",
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 50),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.orangeAccent, width: 3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: EasyRichText(
                    "Hi there! I'm Lion!🌟\n What would you like me to call you?",
                    defaultStyle:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                    patternList: const [
                      EasyRichTextPattern(
                        targetString: 'Lion',
                        matchWordBoundaries: false,
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrange),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: nicknamecontroller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Type your nickname here",
                    hintStyle: TextStyle(fontSize: 18),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amberAccent, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amberAccent, width: 5),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amberAccent, width: 5),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () async {
                    print("pressed");
                    // final data=User(nickname: nicknamecontroller.text, avatar: avatar, syndrome: syndrome)
                  await box.put("nickname", nicknamecontroller.text);
                  await box.put("avatar", "assets/31.png");
                  await box.put("syndrome", "generalsyndrome");

                  challengeMap.shuffle(random);
                  weekly_challenges = challengeMap.take(5).toList();
                  print(weekly_challenges);

                  todaysGoals.shuffle(random);
                  today_challenge = todaysGoals[0];
                  print(today_challenge);

                  bonus_challenges = challengeMap.take(3).toList();
                  print(bonus_challenges);

                  await box.put("weekly_challenges", weekly_challenges);
                  await box.put("todays_challenge", today_challenge);
                  await box.put("bonus_challenge", bonus_challenges);

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AvatarPage()));
                  },
                  child: Text(
                    "Let's Go! 🚀",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent.withOpacity(0.8),
                    minimumSize: Size(double.infinity, 50),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}