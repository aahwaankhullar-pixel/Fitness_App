import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:primer_progress_bar/primer_progress_bar.dart';

class ExerciseScreen extends StatefulWidget {
  final String exerciseType;

  const ExerciseScreen({Key? key, required this.exerciseType}) : super(key: key);

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  
  int current_no = 1;
  final box = Hive.box("User");

  String nickname = "";

  @override
  void initState() {
    super.initState();
    nickname = box.get("nickname");
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
      Segment(value: 0, color: Colors.black,),
      Segment(value: 2, color: Colors.grey, ),
    ];

    final sets_progressBar = PrimerProgressBar(
      segments: sets_segment,
      showLegend: false,
      barStyle: SegmentedBarStyle(
          gap: 1,
          size: 9
      ),
    );

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
                    Image.asset("assets/exercise_sample.gif"),
                    SizedBox(height: 20,),
                    Text("Arm Circles", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),),
                    SizedBox(height: 10,),
                    Text("Make circles with your arms like a windmill!", style: TextStyle(color: Colors.black45, fontWeight: FontWeight.w500),),
                    SizedBox(height: 20,),
                    Text("Follow my lead, $nickname", style: TextStyle(fontWeight: FontWeight.w500, color: Colors.blue),),
                    SizedBox(height: 10,),
                    Text("Worth 5 points! ⭐", style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey),),
                    SizedBox(height: 20,),
                    Text("0/2 Sets", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: Colors.blue),),
                    SizedBox(height: 10,),
                    sets_progressBar,
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        print("pressed");
                      },
                      child: Text(
                        "I Did It!",
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
  
}