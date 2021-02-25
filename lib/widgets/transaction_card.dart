import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final String name;
  final String amount;
  final String date;
  final Function deleteTransactionTapped;

  TransactionCard({
    this.name,
    this.amount,
    this.date,
    this.deleteTransactionTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: FittedBox(
              child: Text(amount),
            ),
          ),
        ),
        title: Text(
          name,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          date,
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: deleteTransactionTapped,
        ),
      ),
    );
  }
}
