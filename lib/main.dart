import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:personal_expenses_app/widgets/new_transaction.dart';

import './transaction_wrapper.dart';
import './widgets/new_transaction.dart';
import './widgets/chart.dart';
import '../models/transaction.dart';

void main() {
  // if don't want to enable landscape mode
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? const CupertinoApp()
        : MaterialApp(
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
                  headline3: const TextStyle(color: Colors.white),
                  button: TextStyle(color: Colors.white)),
              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
              )),
              primaryTextTheme: ThemeData.light().textTheme.apply(
                    fontFamily: 'Roboto',
                  ),
              accentTextTheme: ThemeData.light().textTheme.apply(
                    fontFamily: 'Roboto',
                  ),
              errorColor: Colors.orange,
            ),
            home: MyHomePage(),
          );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  // const MyHomePage({Key? key}) : super(key: key);
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  String itemNameInput = '';

  String amountInput = '';

  final List<Transaction> _userTransactions = [];

  bool _showChart = false;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
  }

  @override
  dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void createTxn(String itemName, double amount, DateTime datetime) {
    final newTxn = Transaction(
        id: DateTime.now().toString(),
        itemName: itemName,
        amount: amount,
        category: 'Misc',
        datetime: datetime);

    setState(() {
      _userTransactions.add(newTxn);
    });
  }

  void deleteTxn(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
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

  Widget builderFloatingButton() {
    return Platform.isIOS
        ? Container()
        : FloatingActionButton(
            child: Icon(Icons.add),
            // backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            onPressed: () => _addNewTransaction(context),
          );
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
    final _isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text('Personal Expenses'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Icon(CupertinoIcons.add),
                  onTap: () => _addNewTransaction,
                )
              ],
            ),
          )
        : PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBar(
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Text('Personal Expenses'),
              actions: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => _addNewTransaction(context),
                ),
              ],
            ),
          );
    final txListWidget = Container(
      height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          0.75,
      child: TransactionWrapper(
          transactionsList: _userTransactions, deleteTxn: deleteTxn),
    );

    final mediaqueryCtx = MediaQuery.of(context);

    final bodyRender = SafeArea(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (_isLandscape)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Show Chart',
                    style: Theme.of(context).textTheme.headline5),
                Switch.adaptive(
                    value: _showChart,
                    onChanged: (value) {
                      setState(() {
                        _showChart = value;
                      });
                    })
              ],
            ),
          if (_isLandscape)
            _showChart
                ? Container(
                    height: (mediaqueryCtx.size.height -
                            appBar.preferredSize.height -
                            mediaqueryCtx.padding.top) *
                        0.7,
                    child: Chart(transactionsList: _recentTransactions),
                  )
                : txListWidget,
          if (!_isLandscape)
            Container(
                height: (mediaqueryCtx.size.height -
                        appBar.preferredSize.height -
                        mediaqueryCtx.padding.top) *
                    0.25,
                child: Chart(transactionsList: _recentTransactions)),
          if (!_isLandscape) txListWidget,
        ],
      ),
    ));

    return Platform.isIOS
        ? CupertinoPageScaffold(child: bodyRender)
        : Scaffold(
            appBar: appBar,
            body: bodyRender,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: builderFloatingButton());
  }
}
