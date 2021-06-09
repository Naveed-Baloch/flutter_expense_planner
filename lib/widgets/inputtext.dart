import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyInputText extends StatefulWidget {
  final Function handler;

  MyInputText(this.handler);

  @override
  _MyInputTextState createState() => _MyInputTextState();
}

class _MyInputTextState extends State<MyInputText> {
  final title = TextEditingController();

  final amount = TextEditingController();
DateTime datepicked;
  void selectDate(BuildContext ctx) {
    showDatePicker(
        context: ctx,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now()).then((value)  {
          if(value==null)
            {
              return;
            }
          setState(() {
            datepicked=value;
          });

    }
        );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin:EdgeInsets.only(left: 20,right: 20,top: 20,bottom: (MediaQuery.of(context).viewInsets.bottom+10.0)),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            TextField(
              minLines: 1,
              decoration: InputDecoration(
                  labelText: 'Title', hintText: 'please enter title here'),
              controller: title,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Amount', hintText: 'please enter the amount'),
              controller: amount,
              keyboardType: TextInputType.number,
            ),
            Row(
              children: [
                Expanded(child: Text(  datepicked==null ? 'No Date Chosen':'Picked Date ${DateFormat().add_yMd().format(datepicked)}')),
                FlatButton(
                    onPressed: () {
                      selectDate(context);
                    },
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                          color: Colors.purple, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            RaisedButton(
                color: Colors.purple,
                onPressed: () {
                  final entertitle = title.text;
                  final enteredamount = double.parse(amount.text);

                  if (entertitle.isEmpty || enteredamount <= 0 || datepicked.toString()==null) {
                    return;
                  } else {
                    widget.handler(title.text, double.parse(amount.text),datepicked);
                  }
                },
                child: Text(
                  'Add Transaction',
                  style: TextStyle(color: Colors.white),
                ))
          ],
          crossAxisAlignment: CrossAxisAlignment.end,
        ),
      ),
    );
  }
}
