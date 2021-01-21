import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/transaction.dart';
import './transaction_form.dart';
import './transaction_list.dart';

class CreateTransaction extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CreateTransactionState();
}

class CreateTransactionState extends State<CreateTransaction> {
  final _transactions = [
    Transaction(
      id: Uuid().v4(),
      name: 'Cheesy feet rubber cheese mascarpone.',
      amount: 500,
      date: DateTime.now(),
    ),
    Transaction(
      id: Uuid().v4(),
      name: 'Sample 2',
      amount: 1000,
      date: DateTime.now(),
    ),
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
    return SingleChildScrollView(
      child: Column(
        children: [
          TransactionForm(
            onAddButtonTapped: _addTransaction,
          ),
          TransactionList(
            transactions: _transactions,
          ),
        ],
      ),
    );
  }
}
