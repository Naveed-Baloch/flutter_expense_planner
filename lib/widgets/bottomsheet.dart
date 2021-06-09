import 'package:flutter/material.dart';

class MyBottomSheet extends StatelessWidget {
  void showBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: 'Title', hintText: 'enter the new text'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bottom Sheet Demo'),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () => showBottomSheet(context)
            )
          ],
        ),
        body:Text(
        'THis is body'),
      ),
    );
  }
}
