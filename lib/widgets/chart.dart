import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class BarInfo {
  final String weekDay;
  final double totalAmount;

  BarInfo({this.weekDay, this.totalAmount});
}

class Chart extends StatelessWidget {
  final List<Transaction> transactions;

  Chart(this.transactions);

  double get totalAmountSpent {
    return transactions.fold(0.0, (sum, tx) => tx.amount + sum);
  }

  List<BarInfo> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalAmount = 0;

      for (var tx in transactions) {
        if (tx.date.day == weekDay.day &&
            tx.date.month == weekDay.month &&
            tx.date.year == weekDay.year) {
          totalAmount += tx.amount;
        }
      }

      return BarInfo(
        weekDay: DateFormat.E().format(weekDay),
        totalAmount: totalAmount,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: groupedTransactionValues.reversed
              .map(
                (barInfo) => Flexible(
                  fit: FlexFit.tight,
                  child: Bar(
                    barInfo,
                    totalAmountSpent,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class Bar extends StatelessWidget {
  final BarInfo info;
  final double totalAmount;

  double get percentage {
    return totalAmount > 0 ? info.totalAmount / totalAmount : 0;
  }

  Bar(this.info, this.totalAmount);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: Text(
            info.totalAmount.toString(),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 150,
          width: 40,
          child: Container(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.antiAlias,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromRGBO(220, 220, 220, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: FractionallySizedBox(
              heightFactor: percentage,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Theme.of(context).primaryColorDark,
                        Theme.of(context).primaryColor,
                      ]),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(info.weekDay),
      ],
    );
  }
}
