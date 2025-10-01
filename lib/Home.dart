import 'package:downsyndromeapp/Home.dart';
import 'package:downsyndromeapp/navbar.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:primer_progress_bar/primer_progress_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final box = Hive.box("User");
  List<Segment> steps_segments = [
    Segment(value: 80, color: Colors.white,),
    Segment(value: 14, color: Colors.grey, ),
  ];
  List<Segment> points_segments = [
    Segment(value: 60, color: Colors.white,),
    Segment(value: 14, color: Colors.grey, ),
  ];

  @override
  Widget build(BuildContext context) {
    String nickname= box.get("nickname");
    String avatar= box.get("avatar");
    final steps_progressBar = PrimerProgressBar(
      segments: steps_segments,
      showLegend: false,
      barStyle: SegmentedBarStyle(
        gap: 1,
        size: 9
      ),
    );
    final points_progressBar = PrimerProgressBar(
      segments: points_segments,
      showLegend: false,
      barStyle: SegmentedBarStyle(
          gap: 1,
          size: 9
      ),
    );

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
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Color(0xFFE6F8FA),
                border: Border.all(color: Colors.lightBlueAccent.shade100, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Flexible(
                    child: EasyRichText(
                      "Today's Goal \n Complete one exercise and reach 3000 steps! ",
                      defaultStyle: TextStyle(fontWeight: FontWeight.w500),
                      patternList: [
                        EasyRichTextPattern(
                          targetString: 'Today\'s Goal',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        EasyRichTextPattern(
                          targetString: '🎯',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Image.asset("assets/lion_goal.png", width: 100,),
                ]
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: MediaQuery.of(context).size.width/2-25,
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
                      Text("👟",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5,),
                      Text("Steps Today",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text("2450",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5,),
                      steps_progressBar
                    ],
                  ),
                ),
                SizedBox(width: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: MediaQuery.of(context).size.width/2-25,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.pinkAccent, width: 1),
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFBF82EF),
                        Color(0xFFD8B3F8),
                        // Color(0xFFF3ABEC),
                        Color(0xFFF391EC),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text("⭐",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5,),
                      Text("200 Points",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text("Level 1",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5,),
                      points_progressBar
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}