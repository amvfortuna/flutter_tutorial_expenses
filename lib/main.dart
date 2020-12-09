import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/locale.dart';

import './transaction.dart';
import './transaction_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
        name: 'Cheesy feet rubber cheese mascarpone.',
        amount: 500,
        date: DateTime.now()),
    Transaction(
      name: 'Sample 2',
      amount: 1000,
      date: DateTime.now(),
    ),
    Transaction(
      name: 'Sample 3',
      amount: 2000,
      date: DateTime.now(),
    ),
    Transaction(
      name: 'Sample 4',
      amount: 3000,
      date: DateTime.now(),
    ),
    Transaction(
      name: 'Sample 5',
      amount: 4000,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: _transactions
            .map((tx) => TransactionCard(
                  name: tx.name,
                  amount: tx.amount.toString(),
                  date: DateFormat('d MMM yyyy | h:mm a').format(tx.date),
                ))
            .toList(),
      ),
    );
  }
}
