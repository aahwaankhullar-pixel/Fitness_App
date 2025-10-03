import 'package:downsyndromeapp/Exercises.dart';
import 'package:downsyndromeapp/bodypartexercise.dart';
import 'package:downsyndromeapp/navbar.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

void main() => runApp(BodypartExerciseApp());

class BodypartExerciseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BodypartExerciseHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BodypartExerciseHomePage extends StatelessWidget {
  final box = Hive.box("User");
  final List<Map<String, dynamic>> bodyParts = [
    {"name": "Arms", "color": Colors.pinkAccent, "icon": Icons.fitness_center},
    {"name": "Legs", "color": Colors.lightBlue, "icon": Icons.directions_run},
    {"name": "Core", "color": Colors.orangeAccent, "icon": Icons.whatshot},
    {"name": "Hands", "color": Colors.blueAccent, "icon": Icons.pan_tool},
    {"name": "Neck", "color": Colors.teal, "icon": Icons.accessibility_new},
    {"name": "Back", "color": Colors.blueGrey, "icon": Icons.self_improvement},
  ];

  void onBodyPartTap(String partName) {
    print("Tapped on $partName");
  }

  @override
  Widget build(BuildContext context) {
    String nickname = box.get("nickname");
    String avatar = box.get("avatar");
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Body Part Exercises"),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),

            // Bear image from assets
            Image.asset(avatar,width: 75,),

            SizedBox(height: 20),

            // Title text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Hey aa! Let's make each part of your body super strong! Pick one to start! 💪",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),

            SizedBox(height: 20),

            // Body part buttons
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: bodyParts.map((part) {
                    return GestureDetector(
                      onTap: () => onBodyPartTap(part['name']),
                      child: Container(
                        decoration: BoxDecoration(
                          color: part['color'],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(part['icon'], size: 40, color: Colors.white),
                            SizedBox(height: 12),
                            Text(
                              part['name'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "3 Exercises",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
