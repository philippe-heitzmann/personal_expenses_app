import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/transaction.dart';

class TransactionCard extends StatelessWidget {
  // const TransactionCard({Key? key}) : super(key: key);

  final Transaction transaction;

  TransactionCard({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
                border: Border.all(
              style: BorderStyle.solid,
              color: Theme.of(context).colorScheme.secondary, //Colors.purple,
              width: 3.0,
            )),
            padding: const EdgeInsets.all(5),
            child: Text(
              '\$${transaction.amount.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headline6,
              // ),
            ),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    transaction.itemName,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                // ),
                Container(
                  child: Text(
                    DateFormat.yMMMd().format(transaction.datetime),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ]),
        ],
      ),
    );
  }
}
