import 'dart:ui';

import 'package:expense_planner/transcation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransationList extends StatelessWidget {
  final List<Transcation> transcation;
  final Function handler;

  TransationList(this.transcation, this.handler);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      return Container(
          child: transcation.isEmpty
              ? Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  'No transaction Yet',
                  style: TextStyle(fontFamily: 'OpenSand', fontSize: 20),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  height: constraints.maxHeight*.6,
                  child: Image(
                    image: AssetImage('assets/images/waiting.png'),
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          )
              : ListView.builder(
            itemBuilder: (
                ctx,
                index,
                ) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.purple,
                    radius: 30,
                    child: FittedBox(
                        child: Text(
                          '\$${transcation[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  title: Text(
                    transcation[index].title,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(DateFormat()
                      .add_yMMMMd()
                      .format(transcation[index].dateTime)),
                  trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () => handler(index)),
                ),
              );
            },
            itemCount: transcation.length,
          )
      );
    });
  }
}
