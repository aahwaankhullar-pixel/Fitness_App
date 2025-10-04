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
          child: Column(
            children: [
              Container(
                child: Image.asset(avatar,width: 200,),
                
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for(dynamic avatar in avatars)
                      
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(avatar["asset"]),
                            
                            
                          ),
                          
                          
                        ),
                      )
                    
                    
                  ],
                  
                  
                ),
                
              ),
              
              
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