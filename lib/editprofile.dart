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

  final List<String> syndromes=[
    "Down Syndrome",
    "Autism Spectrum Disorder",
    "Williams Syndrome",
    "Noonan Syndrome",
  ];

  String selectedAvatar = "";
  String selectedSyndrome = "";
  late TextEditingController nicknamecontroller;

  @override
  void initState() {
    super.initState();
    String nickname = box.get("nickname") ?? "";
    String avatar = box.get("avatar") ?? "assets/lion.2.png";
    String syndrome = box.get("syndrome");
    nicknamecontroller = TextEditingController(text: nickname);
    selectedAvatar = avatar;
    selectedSyndrome = syndrome;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit your profile"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      
      body:
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Container(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(selectedAvatar),
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
                          onTap: (){
                            setState(() {
                              selectedAvatar = avatar["asset"];
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(),
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                            // padding: EdgeInsets.all(),
                            child: CircleAvatar(
                              radius: 40,
                              child: Image.asset(
                                avatar["asset"],
                                width: 100,
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
                SizedBox(height: 20,),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: "Choose what best describes you:",
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Color(0xFF154790), width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Color(0xFF154790), width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.red.shade300, width: 1.5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                  value: selectedSyndrome,
                  icon: Icon(Icons.keyboard_arrow_down, color: Color(0xFF154790)),
                  items: syndromes.map((String s) {
                    print(s);
                    return DropdownMenuItem<String>(
                      value: s,
                      child: Text(s),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedSyndrome = newValue!;
                    });
                  },
                  validator: (value) {
                    if (value == null) return "Choose what best describes you:";
                    return null;
                  },
                ),
SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () async {
                    print("pressed");
                    await box.put("nickname", nicknamecontroller.text);
                    await box.put("avatar", selectedAvatar);
                    await box.put("syndrome", selectedSyndrome ?? "general");
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Confirm Changes",
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
          ),
        )
    );
  }
}