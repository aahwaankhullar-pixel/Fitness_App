import 'dart:math';

import 'package:downsyndromeapp/exercises_db.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:primer_progress_bar/primer_progress_bar.dart';

class ExerciseScreen extends StatefulWidget {
  final String exerciseType;
  final String exerciseCategory;

  const ExerciseScreen({Key? key, required this.exerciseType, required this.exerciseCategory}) : super(key: key);

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  
  int current_no = 1;
  int current_exercise_index = 0;
  int current_set = 0;
  final box = Hive.box("User");

  String nickname = "";
  List<Map<String, dynamic>> all_exercises = [];
  List<Map<String, dynamic>> exercises = [];
  final random = Random();

  @override
  void initState() {
    super.initState();
    nickname = box.get("nickname");
    all_exercises = bodyParts[widget.exerciseType]!;
    print(all_exercises);
    all_exercises.shuffle(random);
    exercises = all_exercises.take(3).toList();
    print(exercises);
  }

  @override
  Widget build(BuildContext context) {
    List<Segment> exercise_segment = [
      Segment(value: current_no, color: Colors.black,),
      Segment(value: 3-current_no, color: Colors.grey, ),
    ];

    final level_progressBar = PrimerProgressBar(
      segments: exercise_segment,
      showLegend: false,
      barStyle: SegmentedBarStyle(
          gap: 1,
          size: 9
      ),
    );

    List<Segment> sets_segment = [
      Segment(value: current_set, color: Colors.black,),
      Segment(value: 2-current_set, color: Colors.grey, ),
    ];

    final sets_progressBar = PrimerProgressBar(
      segments: sets_segment,
      showLegend: false,
      barStyle: SegmentedBarStyle(
          gap: 1,
          size: 9
      ),
    );

    // Get current exercise data
    Map<String, dynamic> currentExercise = exercises.isNotEmpty ? exercises[current_exercise_index] : {};

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.exerciseType, textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Text("$current_no of 3",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),)
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              // SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent.shade100,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Exercise Progress", style: TextStyle(fontWeight: FontWeight.w700),),
                        Text("$current_no/3")
                      ],
                    ),
                    level_progressBar,
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Image.asset(currentExercise['image'] ?? "assets/exercise_sample.gif"),
                    SizedBox(height: 20,),
                    Text(currentExercise['name'] ?? "Exercise", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),),
                    SizedBox(height: 10,),
                    Text(currentExercise['instructions'] ?? "Complete this exercise!", style: TextStyle(color: Colors.black45, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
                    SizedBox(height: 20,),
                    Text("Follow my lead, $nickname", style: TextStyle(fontWeight: FontWeight.w500, color: Colors.blue),),
                    SizedBox(height: 10,),
                    Text("Worth ${currentExercise['points'] ?? 5} points! ⭐", style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey),),
                    SizedBox(height: 20,),
                    Text("$current_set/2 Sets", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: Colors.blue),),
                    SizedBox(height: 10,),
                    EasyRichText(
                      "Quick Heads-Up: ${currentExercise['safety'] ?? ""}",
                      defaultStyle: TextStyle(color: Colors.black45, fontWeight: FontWeight.w500), textAlign: TextAlign.center,
                      patternList: [
                        EasyRichTextPattern(
                          targetString: 'Quick Heads-Up:',
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                    // Text("Quick Heads-Up ${currentExercise['safety'] ?? ""}", style: TextStyle(color: Colors.black45, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
                    SizedBox(height: 20,),
                    sets_progressBar,
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        _completeSet();
                      },
                      child: Text(
                        current_set < 2 ? "I Did It!" : "Complete Exercise!",
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
              )
            ],
          ),
        ),
      )
    );
  }

  void _completeSet() {
    setState(() {
      if (current_set < 2) {
        // Complete a set
        current_set++;
      } else {
        // Complete the current exercise and move to next
        _moveToNextExercise();
      }
    });
  }

  void _moveToNextExercise() {
    if (current_exercise_index < exercises.length - 1) {
      // Move to next exercise
      setState(() {
        current_exercise_index++;
        current_no++;
        current_set = 0; // Reset sets for new exercise
      });
    } else {
      // All exercises completed
      _showCompletionDialog();
    }
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("🎉 Congratulations!"),
          content: Text("You've completed all exercises! Great job, $nickname!"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                Navigator.of(context).pop(); // Go back to previous screen
              },
              child: Text("Awesome!"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrangeAccent,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }
  
}