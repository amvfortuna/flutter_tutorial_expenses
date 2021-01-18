import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final Function(String, double) onAddButtonTapped;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  TransactionForm({this.onAddButtonTapped});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
            ),
            Container(
              height: 44,
              width: double.infinity,
              margin: EdgeInsets.only(top: 15),
              child: RaisedButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text(
                  'Add transaction',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                onPressed: () {
                  onAddButtonTapped(
                    _titleController.text,
                    double.parse(_amountController.text),
                  );

                  _titleController.clear();
                  _amountController.clear();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
