import 'package:flutter/material.dart';

import './transaction.dart';

class TransactionCard extends StatelessWidget {
  // const TransactionCard({Key? key}) : super(key: key);

  final Transaction transaction;

  TransactionCard({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          ElevatedButton(onPressed: null, child: Text(transaction.itemName)),
          ElevatedButton(
            onPressed: null,
            child: Text(transaction.amount.toString()),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.start,
      ),
    );
  }
}
