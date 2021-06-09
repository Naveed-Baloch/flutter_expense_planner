import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyListViewBuilder extends StatelessWidget {
  var listcontent = [
    'java',
    'c++',
    'oop',
    'AI',
    'Data science',
    'Assembly Language',
  ];

  void _showBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return Container(
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: 'Title', hintText: 'enter the new text'),
          ),
        );
      },
    );
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
                onPressed: () => _showBottomSheet(context))
          ],
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(20.0),
              elevation: 20,
              child: Container(
                height: 100,
                width: double.infinity,
                margin: EdgeInsets.all(20.0),
                color: Colors.purple,
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Text(
                    listcontent[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            );
          },
          itemCount: listcontent.length,
        ),
      ),
    );
  }
}


//code for the list view builder will be below for the list items for the (context, index) {
//                   return Container(
//                       child: Card(
//                     elevation: 10,
//                     child: Row(
//                       children: [
//                         Container(
//                           //for amount
//                           child: Container(
//                             child: Text(
//                               '\$${transcation[index].amount.toStringAsFixed(2)}',
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   color: Colors.purple,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             margin: EdgeInsets.symmetric(
//                                 vertical: 10, horizontal: 15),
//                           ),
//                           decoration: BoxDecoration(
//                               border:
//                                   Border.all(color: Colors.purple, width: 2)),
//                           margin: EdgeInsets.symmetric(
//                               vertical: 10, horizontal: 15),
//                         ),
//                         Container(
//                           // for the title and date time
//                           margin: EdgeInsets.only(left: 20),
//                           child: Column(
//                             children: [
//                               Text(
//                                 transcation[index].title,
//                                 style: TextStyle(
//                                     fontSize: 15, fontWeight: FontWeight.bold),
//                               ),
//                               Container(
//                                   margin: EdgeInsets.only(top: 10),
//                                   child: Text(
//                                     DateFormat.yMMMd()
//                                         .format(transcation[index].dateTime),
//                                     style: TextStyle(color: Colors.grey),
//                                   )),
//                             ],
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                           ),
//                         )
//                       ],
//                     ),
//                   ));
//                 },