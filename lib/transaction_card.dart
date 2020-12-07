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
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border(
                  top: BorderSide(color: Colors.transparent),
                  left: BorderSide(color: Colors.transparent),
                  bottom: BorderSide(color: Colors.transparent),
                  right: BorderSide(color: Colors.transparent),
                ),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: FittedBox(
                child: Text(
                  amount,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
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
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
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
