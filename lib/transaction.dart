import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Transaction extends StatelessWidget {
  String id;
  String itemName = '';
  String amount = '0.0';
  String category;

  Transaction(
      {required this.id,
      required this.itemName,
      required this.amount,
      required this.category});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Text(id), Text(itemName), Text(amount), Text(category)],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
