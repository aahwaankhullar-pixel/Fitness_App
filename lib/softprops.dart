import 'package:downsyndromeapp/PropExercises.dart';
import 'package:downsyndromeapp/navbar.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SoftProps extends StatefulWidget {
  const SoftProps({super.key});

  @override
  State<SoftProps> createState() => _SoftPropsState();
}

class _SoftPropsState extends State<SoftProps> {
  final box = Hive.box("User");

  @override
  Widget build(BuildContext context) {
    String nickname = box.get("nickname");
    String avatar = box.get("avatar");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Exercises with Soft props"),
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
                border: Border.all(color: Colors.pinkAccent, width: 1),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFF06292),
                    Color(0xFF9575CD),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),

              child: Column(
                children: [
                  Text("🧸",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5,),
                  Text("Soft Props",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text("Safe and soft items for gentle exercises.",
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
          onTap: (){},


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
                Icon(Icons.bed, size: 28),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      " Pillow Pillower\n3 Exercises using Pillows",
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
              onTap: (){},


              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFF1C1), // pastel yellow
                      Color(0xFFFFCCE5), // soft pink
                      Color(0xFFD5C7FF), // lavender
                      Color(0xFFC2F0FF), // light blue
                      Color(0xFFC9FFE5), // mint green
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
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
                          " Stuffed Toy Fun\n3 Exercises using Stuffed toys",
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