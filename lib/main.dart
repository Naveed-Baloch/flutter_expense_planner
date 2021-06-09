import 'package:expense_planner/widgets/chart.dart';
import 'package:expense_planner/widgets/transcation_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './widgets/inputtext.dart';
import 'transcation.dart';
import 'dart:io';

void main() {
  Widget testWidget = new MediaQuery(
      data: new MediaQueryData(), child: new MaterialApp(home: MyHome()));
  runApp(testWidget);
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
      theme: ThemeData(primarySwatch: Colors.purple, fontFamily: 'Opensans'),
    );
  }
}

class MyApp extends StatefulWidget with WidgetsBindingObserver{
  @override
  _MyAppState createState() => _MyAppState();
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    print('app life cycle changes ');
    super.didChangeAppLifecycleState(state);
  }

}

class _MyAppState extends State<MyApp> {
  final List<Transcation> transcation = [];
  bool islandscaped = false;
  bool showchart = false;


  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
  }


  @override
  void didUpdateWidget(MyApp oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void _addtransaction(String title, double amount, DateTime chosendate) {
    final transcation_new = Transcation(
        id: DateTime.now().toString(),
        title: title,
        amount: (amount),
        dateTime: chosendate);
    //  this fucntion will add the new transaction
    print('title:title');
    setState(() {
      transcation.add(transcation_new);
    });
    Navigator.of(context).pop();
  }

  void _deleteTransaction(int index) {
    setState(() {
      transcation.removeAt(index);
    });
  }

  void _showbottomsheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (bctx) {
          return GestureDetector(
            child: MyInputText(_addtransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  List<Transcation> get _recentTransaction {
    return transcation.where((i_transaction) {
      return i_transaction.dateTime
          .isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  Widget _buildChart(BuildContext context, AppBar appbar) {
    return Container(
        height: MediaQuery.of(context).size.height * .7 -
            appbar.preferredSize.height,
        child: MyChart(_recentTransaction));
  }

  @override
  Widget build(BuildContext context) {
    islandscaped = MediaQuery.of(context).orientation == Orientation.landscape;
    final appbar = AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: Text('Expense Planner App'),
      actions: [
        IconButton(
            icon: Icon(Icons.add),
            color: Colors.white,
            onPressed: () {
              print('Device size is ' +
                  (MediaQuery.of(context).size.height).toString());
              _showbottomsheet(context);
            }),
      ],
    );
    final mychart = Container(
        height: MediaQuery.of(context).size.height * .4 -
            appbar.preferredSize.height,
        child: MyChart(_recentTransaction));
    final mylist = Container(
        height: MediaQuery.of(context).size.height * .6 -
            appbar.preferredSize.height,
        child: TransationList(transcation, _deleteTransaction));
    return MaterialApp(
      home: Scaffold(
        appBar: appbar,
        body: SingleChildScrollView(
          child: Column(
            children: [
              if (islandscaped)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Show Chart'),
                    Switch(
                        value: showchart,
                        onChanged: (val) {
                          setState(() {
                            showchart = val;
                          });
                        })
                  ],
                ),
              if (!islandscaped) mychart,
              if (!islandscaped) mylist,
              if (islandscaped)
                showchart ? _buildChart(context, appbar) : mylist,
            ],
          ),
        ),
        floatingActionButton: Platform.isIOS
            ? Container()
            : FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () => _showbottomsheet(context),
                backgroundColor: Colors.purple,
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
