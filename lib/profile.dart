import 'package:downsyndromeapp/Profile.dart';
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
          child: Column(
            children: [
          
            SizedBox(height: 25,),

              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.deepPurpleAccent,
                      Colors.purple
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
                    Text("$nickname",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                    Text("$syndrome",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.white),),
                    
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
                          Text("Fitness Level",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 10,color: Colors.white),),
                          Text("Level 3",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),),

                          
                        ],
                        
                        
                        
                        
                      ),
                       
                      ),

                  ],


                ),



              ),



              SizedBox(height: 20,),

                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          width: MediaQuery.of(context).size.width/2-25,
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
                          width: MediaQuery.of(context).size.width/2-25,
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
              color: Colors.white,
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
            
            child: 
            Column(
              children: [
                Text("Level Progress",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 15,color: Colors.black),textAlign: TextAlign.center,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Level 1",
                      style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: Colors.black),
                    ),
                    Text(
                      "Level 2",
                      style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: Colors.black),
                    ),
                  ],
                ),

level_progressBar,


              ],
            ),


          )











            ],

          
          
          
          
          
          
          ),
        )







    );

  }
}