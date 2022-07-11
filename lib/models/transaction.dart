import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Transaction {
  final String id;
  final String itemName;
  final double amount;
  final String category;
  final DateTime datetime;

  Transaction(
      {required this.id,
      required this.itemName,
      required this.amount,
      required this.category,
      required this.datetime});
}
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           child: Text(itemName),
//           color: Colors.blue,
//           width: double.infinity,
//         ),
//         Column(children: [Text(amount as String)]),
//         Text(category)
//       ],
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     );
//   }
// }
