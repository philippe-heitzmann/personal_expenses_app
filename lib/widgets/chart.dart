import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  // const Chart({Key? key}) : super(key: key);

  final List<Transaction> transactionsList;

  Chart({required this.transactionsList});

  List<Map<String, dynamic>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      for (var i = 0; i < transactionsList.length; i++) {
        if (transactionsList[i].datetime.day == weekDay.day &&
            transactionsList[i].datetime.month == weekDay.month &&
            transactionsList[i].datetime.year == weekDay.year) {
          totalSum += transactionsList[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get _totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, ele) {
      return sum + ele['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(5),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactionValues.map((data) {
              return Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: ChartBar(
                  label: data['day'],
                  spendingAmount: data['amount'],
                  spendingPctOfTotal: _totalSpending == 0.0
                      ? 0.0
                      : data['amount'] / _totalSpending,
                ),
              );
            }).toList(),
          ),
        ));
  }
}
