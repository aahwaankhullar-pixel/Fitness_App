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

        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFB2FDC9), Color(0xFF80DFFF)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          border: Border.all(color:  Color(0xFF80DFFF), width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "Soft Props",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Soft and safe items for gentle exercises",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ],
            ),

          ],
        ),
      ),

          ],



        ),
      )

    );
  }
}