import 'package:expense_planner/transcation.dart';
import 'package:expense_planner/widgets/chartbars.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyChart extends StatelessWidget {
  final List<Transcation> transcation;

  MyChart(this.transcation);

  double _totalSpending() {
    double sum = 0.0;
    for (var i = 0; i < transcation.length; i++) {
      sum = sum + transcation[i].amount;
    }
    print('sum is :' + sum.toString());
    return sum;
  }

  List<Map<String, Object>> get transcationValues {
    return List.generate(7, (index) {
      final weeekday = DateTime.now().subtract(Duration(days: index));
      double totalsum = 0;
      for (var i = 0; i < transcation.length; i++) {
        if (transcation[i].dateTime.day == weeekday.day &&
            transcation[i].dateTime.month == weeekday.month &&
            transcation[i].dateTime.year == weeekday.year) {
          totalsum = (totalsum + transcation[i].amount);
        }
      }
      return {
        'day': DateFormat.E().format(weeekday).substring(0, 1),
        'amount': totalsum
      };
    }).reversed.toList();
  }
  @override

  @override
  Widget build(BuildContext context) {

    return Card(
        elevation: 10,
        margin: EdgeInsets.all(20),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: transcationValues.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    data['day'],
                    data['amount'],
                    _totalSpending() == 0.0
                        ? 0.0
                        : (data['amount'] as double) / _totalSpending()),
              );
            }).toList()
              ,

          ),
        ));
  //  @override

    }

}
