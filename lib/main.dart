import 'dart:math';
import 'package:flutter/material.dart';

// This is where the flutter app starts, code runs from top down
void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Ask Me Anything'),
        ),
        body: EightBall(),
      ),
    ),
  );
}

// Stateful widgets are widgets that changes state
class EightBall extends StatefulWidget {
  @override
  _EightBallState createState() => _EightBallState();
}

// Variable declared as int with math random function, 0 - 5, exc 5, +1 generated
class _EightBallState extends State<EightBall> {
  int ballDecisionNumber = Random().nextInt(5) + 1;

  //Function
  void changeBallFace() {
    setState(() {
      ballDecisionNumber = Random().nextInt(5) + 1;
    });
  }

  //Anything in the build changes with hot reload
  @override
  Widget build(BuildContext context) {
    return Center(
      // Center frame is created
      child: Row(
        // A row in the frame
        children: <Widget>[
          // Children (not child) can be created in a Center
          Expanded(
            // Expand is a row that expands as big as the screen can go
            child: FlatButton(
              // Invisible button
              onPressed: () {
                changeBallFace(); // calls the function changeBallFace that changes the state
              },
              child: Image.asset(
                  'images/ball$ballDecisionNumber.png'), // state of "ball1.png" for examples is changed
            ),
          ),
        ],
      ),
    );
  }
}
