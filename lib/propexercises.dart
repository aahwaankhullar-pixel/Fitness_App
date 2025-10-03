import 'package:downsyndromeapp/PropExercises.dart';
import 'package:downsyndromeapp/navbar.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class PropExercises extends StatefulWidget {
  const PropExercises({super.key});

  @override
  State<PropExercises> createState() => _PropExercisesState();
}

class _PropExercisesState extends State<PropExercises> {
  final box = Hive.box("User");

  @override
  Widget build(BuildContext context) {
    String nickname = box.get("nickname");
    String avatar = box.get("avatar");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Prop Exercises"),
        automaticallyImplyLeading: false,
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
        
            children: [
              SizedBox(height: 10,),
              Row(
                children: [
                  Image.asset("assets/lion.2.png", width: 50),
                  SizedBox(width: 10,),
                  Column(
                    children: [
                      EasyRichText(
                        "Exercise with props, $nickname! \nUse items from home for fun workouts!",
                        defaultStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.left,
                        patternList: [
                          EasyRichTextPattern(
                            targetString: 'Exercise with props, $nickname',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
        
                    ],
                  ),
                ],
              ),
          const SizedBox(height: 30),
        
        
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFF4A7A7), Color(0xFFAF80FF)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  border: Border.all(color:  Color(0xFFAF80FF), width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Exercise at Home!",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Look around your home for these safe items and let's\nexercise together!",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.directions_run,
                      color: Colors.black,
                      size: 40,
                    ),
                  ],
                ),
              ),
        SizedBox(height:20),
        
          const Center(
            child: Text(
                   "Choose a category",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
        
              GestureDetector(
                onTap: (){
        
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.lightGreen,
                        Colors.cyan
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    border: Border.all(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.toys, size: 28),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "Soft Props\nSoft and safe items for gentle exercises.",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
        
        
                ),
              ),
          const SizedBox(height: 15),
        
          // Body Parts Button
              GestureDetector(
                onTap: (){
        
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.deepPurpleAccent
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    border: Border.all(color: Colors.blueAccent, width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.sports_football, size: 28),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "Ball Games\nFun exercises with different types of balls.",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
        
        
                ),
              ),
          const SizedBox(height: 15),
        
              GestureDetector(
                onTap: (){
        
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.pinkAccent,
                        Colors.pink
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    border: Border.all(color: Colors.pink, width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.kitchen, size: 28),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "Kitchen Helpers\nSafe Kitchen items for gentle workouts.",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
        
        
                ),
              ),
          SizedBox(height: 20,),
        
              GestureDetector(
                onTap: (){
        
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.deepOrange,
                        Colors.redAccent
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    border: Border.all(color: Colors.orange, width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.chair, size: 28),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "Chair Exercises\nSafe exercises using a sturdy chair.",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
        
        
                ),
              ),
        
        
            ],
          ),
        ),
      ),
    );
  }


}
