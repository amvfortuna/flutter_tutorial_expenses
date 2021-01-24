import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final String name;
  final String amount;
  final String date;

  TransactionCard({
    this.name,
    this.amount,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: FittedBox(
                child: Text(
                  amount,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  left: 10,
                  right: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
