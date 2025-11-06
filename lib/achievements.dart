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
  Map<dynamic, dynamic> today_challenge= {};
  List<dynamic> bonus_challenges= [];
  List<dynamic> weekly_challenges= [];

  @override
  void initState() {
    super.initState();
    fetchChallenges();
  }

  fetchChallenges() async {
    today_challenge = await box.get("todays_challenge") ?? {};
    print(today_challenge);
    weekly_challenges = await box.get("weekly_challenges") ?? [];
    print(weekly_challenges);
    bonus_challenges = await box.get("bonus_challenge") ?? [];
    print(bonus_challenges);
    setState(() {}); // Refresh the UI after fetching data
  }

  final Map<String, IconData> challengeIcons = {
    "directions_walk": Icons.directions_walk,
    "directions_run": Icons.directions_run,
    "self_improvement": Icons.self_improvement,
    "wb_sunny": Icons.wb_sunny,

    "fitness_center": Icons.fitness_center,
    "accessibility_new": Icons.accessibility_new,
    "accessibility": Icons.accessibility,
    "sports_gymnastics": Icons.sports_gymnastics,

    "sports_tennis": Icons.sports_tennis,
    "local_drink": Icons.local_drink,
    "sports_tennis_outlined": Icons.sports_tennis_outlined,
    "bed": Icons.bed,

    "music_note": Icons.music_note,
    "queue_music": Icons.queue_music,
    "directions_run_outlined": Icons.directions_run_outlined,
    "group": Icons.group,

    "calendar_today": Icons.calendar_today,
    "explore": Icons.explore,
    "lightbulb_outline": Icons.lightbulb_outline,
    "emoji_emotions": Icons.emoji_emotions,
  };

  IconData getChallengeIcon(String? name) {
    return challengeIcons[name] ?? Icons.check_circle; // fallback icon
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
              height: 400,
              child: weekly_challenges.isEmpty
                  ? Center(
                      child: Text(
                        "No weekly challenges available",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  : ListView.builder(
                itemCount: weekly_challenges.length,
                itemBuilder: (context, index) {
                  final item = weekly_challenges[index];
                  print(item);
                  return Container(
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
                              child:  Icon(
                                getChallengeIcon(item["icon"] ?? "check_circle"),
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item["title"] ?? "Challenge",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                   Text(
                                    item["instruction"] ?? "Complete this challenge",
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
                             Text(
                              'Progress: ${item["current_progress"] ?? 0}/${item["end_goal"] ?? 0}',
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
                              child:  Text(
                                '${item["points"] ?? 0}',
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
                            SizedBox(height: 10,),
                          ],
                        ),
                      ],
                    ),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    )
    );
  }
}