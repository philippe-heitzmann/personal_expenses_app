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
              color: Colors.purple,
              width: 3.0,
            )),
            padding: const EdgeInsets.all(5),
            child: Text(
              '\$${transaction.amount.toString()}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.purple),
            ),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    transaction.itemName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15),
                  ),
                ),
                Container(
                  child: Text(
                    DateFormat.yMMMd().format(transaction.datetime),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                )
              ]),
        ],
      ),
    );
  }
}
