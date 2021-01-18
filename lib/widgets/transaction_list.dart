import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './transaction_card.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({this.transactions});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: transactions
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