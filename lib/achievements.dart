import 'dart:math';

import 'package:downsyndromeapp/Exercises.dart';
import 'package:downsyndromeapp/bodypartexercise.dart';
import 'package:downsyndromeapp/danceexercises.dart';
import 'package:downsyndromeapp/navbar.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:primer_progress_bar/primer_progress_bar.dart';

class Achievements extends StatefulWidget {
  const Achievements({super.key});

  @override
  State<Achievements> createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {
  final box = Hive.box("User");
  Map<String, dynamic> today_challenge= {};
  List<Map<String, dynamic>> bonus_challenges= [];
  List<Map<String, dynamic>> weekly_challenges= [];

  @override
  void initState() {
    super.initState();
    fetchChallenges();
  }

  fetchChallenges() async {
    today_challenge = await box.get("todays_challenge");
    weekly_challenges = await box.get("weekly_challenges");
    bonus_challenges = await box.get("bonus_challenges");
  }

  @override
  Widget build(BuildContext context) {
    List<Segment> weekly_segments = [
      Segment(value: 80, color: Colors.black,),
      Segment(value: 14, color: Colors.grey, ),
    ];
    List<Segment> challenge1_segments = [
      Segment(value: 80, color: Colors.black,),
      Segment(value: 80, color: Colors.grey, ),
    ];
    List<Segment> challenge2_segments = [
      Segment(value: 80, color: Colors.black,),
      Segment(value: 30, color: Colors.grey, ),
    ];
    List<Segment> challenge3_segments = [
      Segment(value: 80, color: Colors.black,),
      Segment(value: 14, color: Colors.grey, ),
    ];
    List<Segment> challenge4_segments = [
      Segment(value: 80, color: Colors.black,),
      Segment(value: 60, color: Colors.grey, ),
    ];
    ;
    final weekly_progressBar = PrimerProgressBar(
      segments: weekly_segments,
      showLegend: false,
      barStyle: SegmentedBarStyle(
          gap: 1,
          size: 9
      ),
    );

    final challenge1_progressBar = PrimerProgressBar(
      segments: challenge1_segments,
      showLegend: false,
      barStyle: SegmentedBarStyle(
          gap: 1,
          size: 9
      ),
    );

    final challenge2_progressBar = PrimerProgressBar(
      segments: challenge2_segments,
      showLegend: false,
      barStyle: SegmentedBarStyle(
          gap: 1,
          size: 9
      ),
    );

    final challenge3_progressBar = PrimerProgressBar(
      segments: challenge3_segments,
      showLegend: false,
      barStyle: SegmentedBarStyle(
          gap: 1,
          size: 9
      ),
    );

    final challenge4_progressBar = PrimerProgressBar(
      segments: challenge4_segments,
      showLegend: false,
      barStyle: SegmentedBarStyle(
          gap: 1,
          size: 9
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Achievements & Tasks"),
        automaticallyImplyLeading: false,
      ),
      body:SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 10,),

              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFB388FF), // light purple
                      Color(0xFF7C4DFF), // deep purple
                      Color(0xFF9575CD), // soft lavender
                    ],
                  ),
                  border: Border.all(color: Color(0xFFE0FFFF), width: 2),
                  borderRadius: BorderRadius.circular(15),
                ),

                child:Column(
                  children: [
                    Text("This Week",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),textAlign: TextAlign.center,),
                    SizedBox(height:10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tasks Completed",
                          style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.grey),
                        ),
                        Text(
                          "1/5",
                          style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                      ],
                    ),

                    weekly_progressBar,

                    Text("4 Tasks Remaining", textAlign: TextAlign.center,style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.white)),

                  ],
                ),
              ),


              SizedBox(height: 20,),

              const Center(
                child: Text(
                  'Weekly Challenges',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: 20),

              Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                    color: Colors.black12.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  // Title Row with Icon
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.sports_gymnastics,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Daily Warm-up',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Complete warm-up exercises 5 days this week',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Progress Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Progress: 3/5',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Color(0xFFEFF0F5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          '25 pts',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  challenge1_progressBar,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "100% complete",
                        style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.grey),
                      ),
                      Text(
                        "Complete!",
                        style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.green),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    )
    );
  }
}