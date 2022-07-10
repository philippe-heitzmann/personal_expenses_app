// text fields

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/main.dart';

import 'package:personal_expenses_app/models/transaction.dart';

class NewTransaction extends StatefulWidget {
  final Function createTxn;

  NewTransaction(this.createTxn);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  DateTime? _selectedDate;

  void submitData() {
    final itemName = _titleController.text;
    final amount = double.parse(_amountController.text);

    if (itemName.isEmpty || amount <= 0 || _selectedDate == null) {
      return;
    }

    widget.createTxn(itemName, amount, _selectedDate);

    Navigator.of(context).pop();
  }

  void presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
            padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom + 10),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: 'Item name'),
                  controller: _titleController,
                  onSubmitted: (_) => submitData(),
                  // onChanged: (val) => itemNameInput = val,
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Amount'),
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => submitData(),
                  // onChanged: (val) => amountInput = val,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_selectedDate == null
                        ? 'No date chosen!'
                        : 'Date picked: ${DateFormat.yMd().format(_selectedDate!)}'),
                    TextButton(
                        onPressed: presentDatePicker,
                        child: Text('Choose date',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue)))
                  ],
                ),
                Container(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: submitData,
                        child: const Text('Add Transaction'),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
