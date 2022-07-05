import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import './transaction.dart';

class TransactionWrapper extends StatelessWidget {
  // const Quiz({Key? key}) : super(key: key);
  // final List<Object> transactions;
  // Quiz(this._answerQuestion, this.questions, this._questionIndex);

  TransactionWrapper({required this.transactionsList});

  final List<Transaction> transactionsList;
  // final List<Map<String, String>> transactionsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ...(transactionsList).map((transaction) {
          return Row(
            children: [
              Container(
                child: Text(transaction.itemName),
              ),
              Container(
                child: Text(transaction.category),
              ),
              // Container(
              //   child: Text(transaction.datetime),
              // ),
              // Container(
              //   child: Text(transaction.itemName),
              // ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          );
          // return Transaction(
          //   id: (transaction['id'] as String),
          //   itemName: (transaction['itemName'] as String),
          //   amount: (transaction['amount'] as double),
          //   category: (transaction['category'] as String),
          //   datetime: (transaction['date'] as DateTime)
          // );
        }), //.toList(),
        // RaisedButton(onPressed: null, child: Text('Answer 1')),
      ],
    );
  }
}
