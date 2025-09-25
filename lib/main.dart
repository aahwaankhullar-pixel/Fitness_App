import 'dart:async';

import 'package:downsyndromeapp/Homescreen.dart';
import 'package:downsyndromeapp/StartPage.dart';
import 'package:downsyndromeapp/User.dart';
import 'package:downsyndromeapp/avatarpage.dart';
import 'package:downsyndromeapp/navbar.dart';
import 'package:downsyndromeapp/onboardingscreen.dart';
import 'package:downsyndromeapp/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());


  await Hive.openBox("User");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      textTheme: GoogleFonts.dmSansTextTheme(
        Theme.of(context).textTheme

      ),
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen>{

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3),
            (){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder:
                  (context) => StartPage()
              )
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF0E1822),
        body: Center(
            child :
            Image.asset("assets/lion.2.png", width: 250,),

            )
        );
    }

}