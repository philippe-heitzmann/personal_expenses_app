import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:personal_expenses_app/transaction_card.dart';

import './transaction_card.dart';
import 'models/transaction.dart';

class TransactionWrapper extends StatelessWidget {
  TransactionWrapper({required this.transactionsList});

  final List<Transaction> transactionsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ...(transactionsList).map((transaction) {
          return TransactionCard(transaction: transaction);
        })
      ],
    );
  }
}
