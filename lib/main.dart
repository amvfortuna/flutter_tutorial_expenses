import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import './widgets/transaction_form.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final List<Transaction> _transactions = [
    // Transaction(
    //   id: Uuid().v4(),
    //   name: 'Cheesy feet rubber cheese mascarpone.',
    //   amount: 500,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: Uuid().v4(),
    //   name: 'Sample 2',
    //   amount: 1000,
    //   date: DateTime.now(),
    // ),
  ];

  void _addTransaction(String title, double amount) {
    final transaction = Transaction(
      id: Uuid().v1(),
      name: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Expense',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Flutter Expense',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TransactionList(
                transactions: _transactions,
              ),
            ],
          ),
        ),
        floatingActionButton: ModalTransactionForm(
          onAddButtonTapped: _addTransaction,
        ),
      ),
    );
  }
}

class ModalTransactionForm extends StatelessWidget {
  final Function(String, double) onAddButtonTapped;

  ModalTransactionForm({this.onAddButtonTapped});

  void presentTransactionForm(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: TransactionForm(
              onAddButtonTapped: onAddButtonTapped,
            ),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => presentTransactionForm(context),
    );
  }
}
