import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
                // return TransactionCard(transaction: transactionsList[index]);
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                              child:
                                  Text('\$ ${transactionsList[index].amount}')),
                        )),
                    title: Text('${transactionsList[index].itemName}',
                        style: Theme.of(context).textTheme.headline5),
                    subtitle: Text(
                      '${DateFormat.yMMMd().format(transactionsList[index].datetime)} ',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                );
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

//child: ))
