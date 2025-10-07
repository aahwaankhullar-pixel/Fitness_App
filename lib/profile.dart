import 'package:downsyndromeapp/Profile.dart';
import 'package:downsyndromeapp/editprofile.dart';
import 'package:downsyndromeapp/navbar.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:primer_progress_bar/primer_progress_bar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final box = Hive.box("User");
  List<Segment> level_segments = [
    Segment(value: 80, color: Colors.black,),
    Segment(value: 14, color: Colors.grey, ),
  ];
  List<Segment> weekly_segments = [
  Segment(value: 80, color: Colors.black,),
  Segment(value: 14, color: Colors.grey, ),
];

  @override
  Widget build(BuildContext context) {
    String nickname = box.get("nickname");
    String avatar = box.get("avatar");
    String syndrome = box.get("syndrome");
    final level_progressBar = PrimerProgressBar(
      segments: level_segments,
      showLegend: false,
      barStyle: SegmentedBarStyle(
          gap: 1,
          size: 9
      ),
    );
    final weekly_progressBar = PrimerProgressBar(
        segments: weekly_segments,
        showLegend: false,
        barStyle: SegmentedBarStyle(
            gap: 1,
            size: 9
        ),
        );

    return Scaffold(
      backgroundColor: Colors.pinkAccent.withOpacity(0.1),
      appBar: AppBar(
      backgroundColor: Colors.lightBlueAccent,
      title: Column(
        children: [
          Text("My Profile", textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          Text("Your fitness journey",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),)

      ],
      ),
      automaticallyImplyLeading: false,

    ),
      body:
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [

              SizedBox(height: 10,),

                Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFB19CD9),
                            Color(0xFFE6E6FA),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        border: Border.all(color: Colors.purpleAccent, width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(avatar,width: 75,),
                          Text("$nickname",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
                          Text("$syndrome",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.black),),

                          SizedBox(height: 10,),

                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(15),
                              ),
                            child: Column(
                              children: [
                                Text("Fitness Level",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 10,color: Colors.black),),
                                Text("Level 3",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black),),


                              ],




                            ),

                            ),

                        ],


                      ),



                    ),
                    Positioned(
                      top:0,
                        right: 0,
                        child: IconButton(
                            onPressed: (){
                                // final data=User(nickname: nicknamecontroller.text, avatar: avatar, syndrome: syndrome)
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));
                            },
                            icon: Icon(Icons.edit),
                        )
                    )
                  ],
                ),



                SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            width: MediaQuery.of(context).size.width/2-30,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.lightBlueAccent, width: 1),
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF8AF8BA),
                                  Color(0xFF78C9F3),
                                  Color(0xFF4CBFF3),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),

                            child: Column(
                              children: [
                                Text("👟",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 5,),
                                Text("Steps Today",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text("2450",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 5,),
                              ],
                            ),
                          ),
                          SizedBox(width: 15,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            width: MediaQuery.of(context).size.width/2-30,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.pinkAccent, width: 1),
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFBF82EF),
                                  Color(0xFFD8B3F8),
                                  // Color(0xFFF3ABEC),
                                  Color(0xFFF391EC),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            child: Column(
                              children: [
                                Text("⭐",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 5,),
                                Text("200 Points",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text("Level 1",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 5,),
                              ],
                            ),
                          )
                        ],
                      ),
            SizedBox(height: 20,),

            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFFA8FFF2), // mint green
                    Color(0xFFFFC0C0), // light pink
                  ],
                ),
                border: Border.all(color: Color(0xFFFFC0C0), width: 2),
                borderRadius: BorderRadius.circular(15),
              ),

              child:
              Column(
                children: [
                  Text("Level Progress",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 15,color: Colors.black),textAlign: TextAlign.center,),
            SizedBox(height:10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Level 1",
                        style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600,color: Colors.black),
                      ),
                      Text(
                        "Level 2",
                        style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600,color: Colors.black),
                      ),
                    ],
                  ),

            level_progressBar,


                  Text("100 points to next level", textAlign: TextAlign.center,style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.black)),

                ],
              ),


            ),
                SizedBox(height:20),





                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFFFF9E6), // very light yellow
                        Color(0xFFFFFFFF), // white
                        Color(0xFFE0FFFF), // very light cyan
                      ],
                    ),
                    border: Border.all(color: Color(0xFFE0FFFF), width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child:
                  Column(
                    children: [
                      Text("This Week",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Colors.black),textAlign: TextAlign.center,),
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
                            style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black),
                          ),
                        ],
                      ),

                      weekly_progressBar,


                      Text("4 Tasks Remaining", textAlign: TextAlign.center,style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.black)),

                    ],
                  ),


                ),
            SizedBox(height: 20,),

                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF8B9AE0),
                        // Ending color (right side) - a very pale off-white/mint
                        Color(0xFFE9F5E3),
                      ],
                    ),
                    border: Border.all(color: Color(0xFFE0FFFF), width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child:
                  Column(
                    children: [
                      Text("Profile Settings",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black),textAlign: TextAlign.center,),
                      SizedBox(height:10),



                      ElevatedButton(onPressed: (){},
                        child:

                        Text("Logout",textAlign:TextAlign.left,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black),),

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent.withOpacity(0.8),
                          minimumSize: Size(double.infinity, 50),
                          padding: EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      )
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