import 'package:downsyndromeapp/Exercises.dart';
import 'package:downsyndromeapp/navbar.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Exercises extends StatefulWidget {
  const Exercises({super.key});

  @override
  State<Exercises> createState() => _ExercisesState();
}

class _ExercisesState extends State<Exercises> {
  final box = Hive.box("User");

  @override
  Widget build(BuildContext context) {
    String nickname = box.get("nickname");
    String avatar = box.get("avatar");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Exercises"),
        automaticallyImplyLeading: false,
      ),

      body:Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
          SizedBox(height: 10,),
        Row(
          children: [
            Image.asset("assets/lion.2.png",width:50),
            SizedBox(width: 10,),
            Column(
              children: [
            EasyRichText("Exercise time, $nickname 💪 \nChoose your favourite activity, friend!",
              defaultStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),textAlign: TextAlign.left,
              patternList: [
                EasyRichTextPattern(
                  targetString: 'Exercise time, $nickname',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),

              ],
            ),
          ],
        ),
        SizedBox(height: 20,),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade400,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Your Progress",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "200 points earned\nKeep moving to earn more!",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.directions_run,
                    color: Colors.white,
                    size: 40,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            const Center(
              child: Text(
                "What would you like to do today?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {

              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.self_improvement, size: 28),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "Warm Up\nGentle exercises to prepare your body",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),

              
            ),
            const SizedBox(height: 15),

            // Body Parts Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {

              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.fitness_center, size: 28),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "Body Parts\nTarget specific muscle groups",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            const SizedBox(height: 15),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.music_note, size: 28),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "Dance & Music\nFun dancing and music activities",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            SizedBox(height: 20,),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white60,
                border: Border.all(color: Colors.grey, width: 3),
                borderRadius: BorderRadius.circular(12),
              ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Exercise tips!",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "• Start with warm-up exercises to prepare your muscles\n• Take breaks when you need them \n• Have fun and move at your own pace!\n • Don't forget to stay hydrated",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.directions_run,
                      color: Colors.white,
                      size: 40,
                    ),
                  ],
                ),



            ),
              ],
        ),
      ),
        );



  }

  }