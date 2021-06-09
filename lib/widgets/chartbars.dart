import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String lable;
  final double total_spending;
  final double percantage;

  ChartBar(this.lable, this.total_spending, this.percantage);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraint){
      return Column(
        children: [
          Container(
            height: constraint.maxHeight*.1,//10
            child: FittedBox(
              child: Text(
                lable.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: constraint.maxHeight*.05,//5
          ),
          Container(
            height: constraint.maxHeight*.7,//60
            width: 10,
            child: Flexible(
              fit: FlexFit.tight,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        color: Color.fromRGBO(220, 220, 220, 1),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  FractionallySizedBox(
                    heightFactor: percantage,
                    child: Container(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.purple,
                        border: Border.all(color: Colors.grey, width: 1.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox( height: constraint.maxHeight*0.04,),//5
          Container(
            height: constraint.maxHeight*.10,
            child: FittedBox(
              child: Text('\$${total_spending.toStringAsFixed(2)}',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      );
    });
  }
}
