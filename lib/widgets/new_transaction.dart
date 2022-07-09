// text fields

import 'package:flutter/material.dart';
import 'package:personal_expenses_app/models/transaction.dart';

class NewTransaction extends StatefulWidget {
  final Function createTxn;

  NewTransaction(this.createTxn);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final itemName = titleController.text;
    final amount = double.parse(amountController.text);

    if (itemName.isEmpty || amount <= 0) {
      return;
    }

    widget.createTxn(itemName, amount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Item name'),
                controller: titleController,
                onSubmitted: (_) => submitData(),
                // onChanged: (val) => itemNameInput = val,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
                // onChanged: (val) => amountInput = val,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: submitData,
                      child: Container(
                        child: const Text(
                          'Submit',
                          style: TextStyle(color: Colors.purple),
                        ),
                      )),
                ],
              ),
            ],
          )),
    );
  }
}
