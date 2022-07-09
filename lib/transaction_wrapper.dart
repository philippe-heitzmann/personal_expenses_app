import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:personal_expenses_app/transaction_card.dart';

import './transaction_card.dart';
import 'models/transaction.dart';

class TransactionWrapper extends StatelessWidget {
  final List<Transaction> transactionsList;

  TransactionWrapper({required this.transactionsList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      child: transactionsList.isEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text('No transactions recorded',
                      style: Theme.of(context).textTheme.headline5),
                ),
                SizedBox(width: 10, height: 20),
                Container(
                  child: Image.asset('assets/images/waiting.png',
                      fit: BoxFit.cover),
                  height: 200,
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionCard(transaction: transactionsList[index]);
              },
              itemCount: transactionsList.length,
              // children: <Widget>[
              //   ...(transactionsList).map((transaction) {
              //     return TransactionCard(transaction: transaction);
              //   })
              // ],
            ),
    );
  }
}
