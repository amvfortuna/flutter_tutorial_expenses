import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import './widgets/transaction_form.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final List<Transaction> _transactions = [];

  List<Transaction> get _recentTransactions {
    final aWeekAgo = DateTime.now().subtract(Duration(days: 7));
    return _transactions.where((tx) => tx.date.isAfter(aWeekAgo)).toList();
  }

  void _addTransaction(String title, double amount, DateTime date) {
    final transaction = Transaction(
      id: Uuid().v1(),
      name: title,
      amount: amount,
      date: date,
    );

    setState(() {
      _transactions.add(transaction);
    });
  }

  void _deleteTransaction(Transaction transaction) {
    setState(() {
      _transactions.remove(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Expense',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
              button: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.white,
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
              Chart(_recentTransactions),
              TransactionList(
                transactions: _transactions,
                onDeleteTransaction: _deleteTransaction,
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
  final Function(String, double, DateTime) onAddButtonTapped;

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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => presentTransactionForm(context),
    );
  }
}
