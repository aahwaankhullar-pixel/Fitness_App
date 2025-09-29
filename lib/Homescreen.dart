import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Downs Syndrome App")),
      body: Column(
        children: [
          Row(
            children: [
              Text(
                "data 1 ",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                "data2",
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ],
          ), 
          SizedBox(height: 20,),
          Row(
children: [
  Expanded(child: TextField(decoration: InputDecoration(labelText: "Enter your name",),)),
  Expanded(child: Text("data 3", style:TextStyle(fontWeight: FontWeight.bold,color: Colors.cyan))),
  SizedBox(width: 10,),
  Expanded(child: Text("data 4", style: TextStyle(fontStyle: FontStyle.italic, color: Colors.amber,))),
  Expanded(child: Icon(Icons.add_circle)),
  Expanded(child: Container(child: Text("data 5", style: TextStyle(color: Colors.black),),color: Colors.amberAccent,height: 80,width: 80,padding:EdgeInsets.all(7),margin: EdgeInsets.all(10),alignment: Alignment.topRight,)),
]
          )
        ],
      ),
    );
  }
}
