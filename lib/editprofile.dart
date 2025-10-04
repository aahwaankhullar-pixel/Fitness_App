import 'package:downsyndromeapp/Profile.dart';
import 'package:downsyndromeapp/navbar.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:primer_progress_bar/primer_progress_bar.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final box = Hive.box("User");

  TextEditingController nicknamecontroller = TextEditingController();

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
  List<String> syndrome=[
    "Down Syndrome",
    "Autism Spectrum Disorder"
    "Williams Syndrome"
    "Noonan Syndrome"
  ];



  @override
  Widget build(BuildContext context) {
    String nickname = box.get("nickname");
    String avatar = box.get("avatar");
    String syndrome = box.get("syndrome");

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit your profile"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      
      body:
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Container(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(avatar),
                ),
              ),
              SizedBox(height: 20,),
              Text("Avatars", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),),
              SizedBox(height: 10,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for(dynamic avatar in avatars)
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          padding: EdgeInsets.all(2),
                          child: CircleAvatar(
                            radius: 40,
                            child: Image.asset(
                              avatar["asset"],
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    SizedBox(width: 10,),
                  ],
                ),
              ),

              SizedBox(height: 20,),
              TextFormField(
                controller: nicknamecontroller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Type your nickname here",
                  hintStyle: TextStyle(fontSize: 18),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amberAccent, width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amberAccent, width: 5),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amberAccent, width: 5),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}