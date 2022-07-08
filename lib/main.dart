import 'package:flutter/material.dart';
import 'package:personal_expenses_app/transaction_wrapper.dart';

import 'models/transaction.dart';
import './transaction_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // const MyHomePage({Key? key}) : super(key: key);
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  String itemNameInput = '';

  String amountInput = '';

  final List<Transaction> transactions = [
    Transaction(
      id: '001',
      itemName: 'Ham',
      amount: 9.99,
      category: 'Grocery',
      datetime: DateTime.now(),
    ),
    Transaction(
      id: '002',
      itemName: 'Apples',
      amount: 3.99,
      category: 'Grocery',
      datetime: DateTime.now(),
    ),
    Transaction(
      id: '003',
      itemName: 'Oranges',
      amount: 4.99,
      category: 'Grocery',
      datetime: DateTime.now(),
    ),
    Transaction(
      id: '004',
      itemName: 'Bread',
      amount: 4.99,
      category: 'Grocery',
      datetime: DateTime.now(),
    ),
    Transaction(
      id: '005',
      itemName: 'Kayak',
      amount: 599.99,
      category: 'Sports',
      datetime: DateTime.now(),
    ),
  ];

  void createTxn(itemName, amount, datetime) {
    setState(() {
      transactions.add(Transaction(
          id: '999',
          itemName: itemName,
          amount: amount,
          category: 'Misc',
          datetime: datetime));
    });
  }

  // @override
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Demo Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            color: Colors.blue,
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  child: Text('Groceries bought:'),
                ),
              ],
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Item name'),
                      controller: titleController,
                      // onChanged: (val) => itemNameInput = val,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      controller: amountController,
                      // onChanged: (val) => amountInput = val,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            // style: ButtonStyle(backgroundColor: Colors.purple),
                            onPressed: () {
                              createTxn(
                                  titleController.text,
                                  double.parse(amountController.text),
                                  DateTime.now());
                            },
                            child: Container(
                              child: Text(
                                'Submit',
                                style: TextStyle(color: Colors.purple),
                              ),
                            )),
                      ],
                    ),
                  ],
                )),
          ),
          TransactionWrapper(transactionsList: transactions),
          // TransactionCard(
          //   transaction: transactions[0],
          // ),
          // TransactionCard(
          //   transaction: transactions[1],
          // ),
          // TransactionCard(
          //   transaction: transactions[2],
        ],
      ),
    );
  }
}
