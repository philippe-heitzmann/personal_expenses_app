import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/transaction_card.dart';

import './main.dart';
import 'models/transaction.dart';

class TransactionWrapper extends StatelessWidget {
  final List<Transaction> transactionsList;
  final Function deleteTxn;

  TransactionWrapper({required this.transactionsList, required this.deleteTxn});

  @override
  Widget build(BuildContext context) {
    return transactionsList.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text('No transactions recorded',
                      style: Theme.of(context).textTheme.headline5),
                ),
                const SizedBox(width: 10, height: 20),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover)),
              ],
            );
          })
        : ListView(
            children: transactionsList
                .map((tx) => TransactionCard(
                    key: ValueKey(tx.id),
                    transaction: tx,
                    deleteTxn: deleteTxn))
                .toList(),
          );
    // : ListView.builder(
    //     itemBuilder: (ctx, index) {
    //       // return TransactionCard(transaction: transactionsList[index]);
    //       return
  }
}

//child: ))
