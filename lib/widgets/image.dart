import 'package:flutter/material.dart';

class Myimage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          height: 200,
          child: Image(
            image: AssetImage('assets/images/waiting.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
