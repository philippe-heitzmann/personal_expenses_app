import 'package:flutter/material.dart';
import 'package:personal_expenses_app/widgets/new_transaction.dart';

import './transaction_wrapper.dart';
import './widgets/new_transaction.dart';
import './widgets/chart.dart';
import '../models/transaction.dart';

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
      theme: ThemeData().copyWith(
        // primarySwatch: Colors.blue,
        // accentColor: Colors.purple,
        colorScheme: ThemeData()
            .colorScheme
            .copyWith(primary: Colors.blue, secondary: Colors.purple),
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 22),
            color: Colors.blue),
        // ignore: deprecated_member_use
        // textTheme: ThemeData.light().textTheme.apply(
        //       fontFamily: 'Roboto',
        //     ),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold),
              headline5: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              headline4: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
        primaryTextTheme: ThemeData.light().textTheme.apply(
              fontFamily: 'Roboto',
            ),
        accentTextTheme: ThemeData.light().textTheme.apply(
              fontFamily: 'Roboto',
            ),
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

  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: '001',
    //   itemName: 'Ham',
    //   amount: 9.99,
    //   category: 'Grocery',
    //   datetime: DateTime.now(),
    // ),
    // Transaction(
    //   id: '002',
    //   itemName: 'Apples',
    //   amount: 3.99,
    //   category: 'Grocery',
    //   datetime: DateTime.now(),
    // ),
    // Transaction(
    //   id: '003',
    //   itemName: 'Oranges',
    //   amount: 4.99,
    //   category: 'Grocery',
    //   datetime: DateTime.now(),
    // ),
    // Transaction(
    //   id: '004',
    //   itemName: 'Bread',
    //   amount: 4.99,
    //   category: 'Grocery',
    //   datetime: DateTime.now(),
    // ),
    // Transaction(
    //   id: '005',
    //   itemName: 'Kayak',
    //   amount: 599.99,
    //   category: 'Sports',
    //   datetime: DateTime.now(),
    // ),
  ];

  void createTxn(String itemName, double amount) {
    final newTxn = Transaction(
        id: '999',
        itemName: itemName,
        amount: amount,
        category: 'Misc',
        datetime: DateTime.now());

    setState(() {
      _userTransactions.add(newTxn);
    });
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.datetime.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(createTxn),
            behavior: HitTestBehavior.opaque,
          );
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
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _addNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              color: Theme.of(context).primaryColor,
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Chart(transactionsList: _recentTransactions),
                ],
              ),
            ),
            TransactionWrapper(transactionsList: _userTransactions)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        // backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        onPressed: () => _addNewTransaction(context),
      ),
    );
  }
}
