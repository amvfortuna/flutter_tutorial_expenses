import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './transaction_card.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(Transaction) onDeleteTransaction;

  TransactionList({this.transactions, this.onDeleteTransaction});

  Widget emptyState(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No transactions yet.',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            child: Expanded(
              child: Image.asset(
                'assets/images/waiting.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty
          ? emptyState(context)
          : ListView.builder(
              itemBuilder: (ctx, idx) {
                final tx = transactions[idx];
                return TransactionCard(
                  name: tx.name,
                  amount: tx.amount.toStringAsFixed(2),
                  date: DateFormat('d MMM yyyy | h:mm a').format(tx.date),
                  deleteTransactionTapped: () {
                    onDeleteTransaction(transactions[idx]);
                  },
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
