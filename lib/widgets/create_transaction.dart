import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './transaction_form.dart';
import './transaction_list.dart';

class CreateTransaction extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CreateTransactionState();
}

class CreateTransactionState extends State<CreateTransaction> {
  List<Transaction> _transactions = [
    Transaction(
      name: 'Cheesy feet rubber cheese mascarpone.',
      amount: 500,
      date: DateTime.now(),
    ),
    Transaction(
      name: 'Sample 2',
      amount: 1000,
      date: DateTime.now(),
    ),
  ];

  void addTransaction(String title, double amount) {
    Transaction transaction = Transaction(
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
    return Column(
      children: [
        TransactionForm(
          onAddButtonTapped: addTransaction,
        ),
        TransactionList(
          transactions: _transactions,
        ),
      ],
    );
  }
}
