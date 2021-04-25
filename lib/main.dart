import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/models.dart/info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>Info(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Page1(),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(child: Top()),
          SizedBox(height: 10,),
          Flexible(child: Bottom()),
        ],
      ),
    );
  }
}

class Top extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var info = Provider.of<Info>(context);
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
              onPressed: (){
                info.chaneTitle("One Piece");
                info.changedescription("Shounen, Action");
                
              }, 
              child: Text("Change Values")),
              OutlinedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Page2()));
              }, 
              child: Text("Next Page")),
          ],
        ),
      ),
    );
  }
}

class Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var info = Provider.of<Info>(context);
    return Container(
      child: Center(
        child: RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: info.title,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)
              ),
              TextSpan(
                text: ": "
              ),
              TextSpan(
                text: info.description,
                style: TextStyle(fontSize: 17)
              ),
            ]
          ),
          ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var info = Provider.of<Info>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
        child: Center(
        child: RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: info.title,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)
              ),
              TextSpan(
                text: ": "
              ),
              TextSpan(
                text: info.description,
                style: TextStyle(fontSize: 17)
              ),
            ]
          ),
          ),
      ),
    ),
    )
    );
  }
}