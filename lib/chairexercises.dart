import 'package:downsyndromeapp/PropExercises.dart';
import 'package:downsyndromeapp/navbar.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'exerciseScreen.dart';

class ChairExercises extends StatefulWidget {
  const ChairExercises({super.key});

  @override
  State<ChairExercises> createState() => _ChairExercisesState();
}

class _ChairExercisesState extends State<ChairExercises> {
  final box = Hive.box("User");

  @override
  Widget build(BuildContext context) {
    String nickname = box.get("nickname");
    String avatar = box.get("avatar");

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text("Chair Exercises"),
          automaticallyImplyLeading: false,
        ),

        body:
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),

          child:
          Column(
            children: [
              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 1),
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF64B5F6),
                      Color(0xFFB39DDB),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),

                child: Column(
                  children: [
                    Text("🪑",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5,),
                    Text("Chair Exercises",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text("Safe exercises using a sturdy chair",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5,),
                  ],
                ),
              ),

              SizedBox(height: 20,),

              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ExerciseScreen(exerciseType: "Chair Support", exerciseCategory: "Chairexercises")));
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFF7C8D0),
                        Color(0xFFE8F0D0),
                        Color(0xFFFDE9C6),
                        Color(0xFFC7E9E8),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.chair_alt, size: 28),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            " Chair Support\n3 Exercises using a Sturdy chair",
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
        )

    );
  }
}