import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/transaction.dart';

class TransactionCard extends StatefulWidget {
  // const TransactionCard({Key? key}) : super(key: key);

  TransactionCard(
      {Key? key, required this.transaction, required this.deleteTxn})
      : super(key: key);

  final Transaction transaction;
  final Function deleteTxn;

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  Color _bgColor = Colors.red;

  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.purple,
    ];
    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
            backgroundColor: _bgColor,
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: FittedBox(child: Text('\$ ${widget.transaction.amount}')),
            )),
        title: Text(widget.transaction.itemName,
            style: Theme.of(context).textTheme.headline5),
        subtitle: Text(
          '${DateFormat.yMMMd().format(widget.transaction.datetime)} ',
          style: Theme.of(context).textTheme.headline4,
        ),
        trailing: MediaQuery.of(context).size.width > 500
            ? TextButton.icon(
                label: const Text('Delete'),
                icon: const Icon(Icons.delete),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                        Theme.of(context).errorColor)),
                onPressed: () => widget.deleteTxn(widget.transaction.id))
            : IconButton(
                color: Theme.of(context).errorColor,
                icon: const Icon(Icons.delete),
                onPressed: () => widget.deleteTxn(widget.transaction.id),
              ),
      ),
    );
  }
}
