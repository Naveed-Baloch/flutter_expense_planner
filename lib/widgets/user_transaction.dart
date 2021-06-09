import 'package:expense_planner/widgets/transcation_list.dart';
import 'package:flutter/material.dart';
import 'inputtext.dart';
import 'package:expense_planner/transcation.dart';
//
// class UserTranscation extends StatefulWidget {
//   @override
//   _UserTranscationState createState() => _UserTranscationState();
// }
//
// class _UserTranscationState extends State<UserTranscation> {
//   final List<Transcation> transcation = [
//     Transcation(
//         id: 't1',
//         title: 'Shoes Expenses',
//         amount: 100,
//         dateTime: DateTime.now()),
//     Transcation(
//         id: 't2',
//         title: 'Laptop Expenses',
//         amount: 100,
//         dateTime: DateTime.now()),
//   ];
//
//   void _addtransaction(String title, double amount) {
//     final  transcation_new = Transcation(
//         id: DateTime.now().toString(),
//         title: title,
//         amount: (amount),
//         dateTime: DateTime.now());
//   //  this fucntion will add the new transaction
//     setState(() {
//       transcation.add(transcation_new);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         MyInputText(_addtransaction),
//         TransationList(transcation)],
//     );
//   }
// }
