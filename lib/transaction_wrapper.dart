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
                SizedBox(width: 10, height: 20),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover)),
              ],
            );
          })
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
                  trailing: MediaQuery.of(context).size.width > 500
                      ? TextButton.icon(
                          label: Text('Delete'),
                          icon: Icon(Icons.delete),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all(
                                  Theme.of(context).errorColor)),
                          onPressed: () =>
                              deleteTxn(transactionsList[index].id))
                      : IconButton(
                          color: Theme.of(context).errorColor,
                          icon: Icon(Icons.delete),
                          onPressed: () =>
                              deleteTxn(transactionsList[index].id),
                        ),
                ),
              );
            },
            itemCount: transactionsList.length,
          );
  }
}

//child: ))
