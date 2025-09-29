import 'package:downsyndromeapp/Home.dart';
import 'package:downsyndromeapp/navbar.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final box=Hive.box("User");
  @override
  Widget build(BuildContext context) {
    String nickname= box.get("nickname");
    return Scaffold(
      body: Container(
        // Gradient background
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [ Color(0xFFE2F8C6), // Light Green (A200)
          Color(0xFF65C7D5),], // Cyan (500)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Character image on top
                SizedBox(
                  height: 180,
                  child: Image.asset(
                    "assets/lionwink.png",
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 20),

                // Greeting text
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.lightBlueAccent, width: 3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: EasyRichText(
                    "Almost there, $nickname! 💪 This helps me create the perfect exercises just for you!",
                    defaultStyle:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                    patternList:  [
                      EasyRichTextPattern(
                        targetString: '$nickname',
                        matchWordBoundaries: false,
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                      ),
                    ],
                  ),
                ),
                // Section title
                SizedBox(height: 25),
                // Cards
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.greenAccent, width: 3),
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: Column(
                    children: [
                      const Text(
                        "Choose what best describes you:",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),

                      _buildOptionCard(
                        context,
                        title: "Down Syndrome",
                        description:
                        "Fun, low-impact workouts to boost strength, balance, and energy safely.",
                        color1: Colors.blueAccent.shade100,
                        color2: Colors.deepPurpleAccent,
                        icon: Icons.insert_chart_outlined_sharp,
                      ),
                      _buildOptionCard(
                        context,
                        title: "Autism Spectrum Disorder",
                        description:
                        "Sensory-friendly fitness games to improve coordination and focus.",
                        color1: Colors.pinkAccent.shade100,
                        color2: Colors.pink,
                        icon: Icons.insert_chart_outlined_sharp,
                      ),
                      _buildOptionCard(
                        context,
                        title: "Williams Syndrome",
                        description:
                        "Playful exercises for better muscle tone, heart health, and movement skills.",
                        color1: Colors.lightGreen.shade300,
                        color2: Color(0xFF10AC7C),
                        icon: Icons.insert_chart_outlined_sharp,
                      ),
                      _buildOptionCard(
                        context,
                        title: "Noonan Syndrome",
                        description:
                        "Gentle cardio and coordination games to build stamina and confidence.",
                        color1: Colors.amberAccent.shade200,
                        color2: Colors.orange.shade600,
                        icon: Icons.insert_chart_outlined_sharp,
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () async {
                    print("pressed");
                    await box.put("syndrome", "generalsyndrome");
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                  },
                  child: Text(
                    "Skip for now 👆",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 50),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    side: BorderSide(color: Colors.black.withOpacity(0.2), // very light transparent border
                      width: 3,),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildOptionCard(
      BuildContext context, {
        required String title,
        required String description,
        required Color color1,
        required Color color2,
        required IconData icon,
      }) {
    return GestureDetector(
      onTap: () async {
        print(title);
        await box.put("syndrome", title);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>NavBar()));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color1, color2],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon in circle
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.25),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 28),
            ),
            const SizedBox(width: 12),

            // Text Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                      fontWeight: FontWeight.w600,
                    ),
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

