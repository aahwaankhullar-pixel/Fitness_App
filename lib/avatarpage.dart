import 'package:downsyndromeapp/onboardingscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:hive/hive.dart';

class AvatarPage extends StatefulWidget {
  const AvatarPage({super.key});

  @override
  State<AvatarPage> createState() => _AvatarPageState();
}

class _AvatarPageState extends State<AvatarPage> {
  String? selectedAvatar;
  final box=Hive.box("User");

  // Avatar list
  final List<Map<String, String>> avatars = [
    {"name": "Penguin", "asset": "assets/31.png"},
    {"name": "Panda", "asset": "assets/32.png"},
    {"name": "Dolphin", "asset": "assets/33.png"},
    {"name": "Jellyfish", "asset": "assets/34.png"},
    {"name": "Snail", "asset": "assets/35-.png"},
    {"name": "Elephant", "asset": "assets/36-.png"},
    {"name": "Kitty", "asset": "assets/37-.png"},
    {"name": "Dog", "asset": "assets/38-.png"},
  ];

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    String nickname= box.get("nickname");
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFE1F5FE), // very light blue
            Color(0xFFEDE7F6), // very light violet
            Color(0xFFFCE4EC), // very light pink
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(
              20, statusBarHeight + kToolbarHeight, 20, 20),
          child: Column(
            children: [
              // Top image
              Image.asset(
                "assets/lion.happy.png",
                width: 150,
                height: 150,
              ),
              SizedBox(height: 15),
              // Greeting box
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.purpleAccent, width: 3),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: EasyRichText(
                  "Great choice, $nickname! 🎨 Pick your favorite buddy to be your avatar!",
                  defaultStyle: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                  patternList:  [
                    EasyRichTextPattern(
                      targetString: '$nickname',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),

              Text(
                "✨ Choose Your Avatar ✨",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: avatars.length,
                  itemBuilder: (context, index) {
                    final avatar = avatars[index];
                    final isSelected = selectedAvatar == avatar["asset"];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedAvatar = avatar["asset"];
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: isSelected
                                ? Colors.deepPurple
                                : Colors.grey.shade300,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              avatar["asset"]!,
                              width: 50,
                              height: 50,
                            ),
                            SizedBox(height: 8),
                            Text(
                              avatar["name"]!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () async {
                  print("Selected Avatar: $selectedAvatar");
                  await box.put("avatar", selectedAvatar);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OnboardingScreen()));
                },
                child: Text(
                  "I'm Ready! 🎈",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () async {
                  print("Skip pressed");
                  await box.put("avatar", "assets/31.png");
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OnboardingScreen()));
                },
                child: Text(
                  "Skip for now 👆",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  side: BorderSide(
                    color: Colors.black.withOpacity(0.2),
                    width: 2,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
