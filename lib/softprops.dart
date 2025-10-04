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
                border: Border.all(color: Colors.lightBlueAccent, width: 1),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF8AF8BA),
                    Color(0xFF78C9F3),
                    Color(0xFF4CBFF3),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
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

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.lightBlueAccent, width: 1),
                borderRadius: BorderRadius.circular(20),
               color: Colors.white
              ),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.bed),
                  SizedBox(width: 7,),


                  Expanded(
                  child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child:
                      Column(
                        children: [
                  Text("Pillow Power",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text("3 exercises using pillows",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.left,
                      ),
],

                  ),
                  ),






                  )



                ],

              ),
            )

          ],



        ),
      )

    );
  }
}