import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final Function(String, double) onAddButtonTapped;

  TransactionForm({this.onAddButtonTapped});

  @override
  State<StatefulWidget> createState() => TransactionFormState();
}

class TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  void _addButtonPressed() {
    final title = _titleController.text;
    final amount = double.tryParse(_amountController.text);

    if (title.isEmpty || amount != null && amount <= 0) {
      return;
    }

    widget.onAddButtonTapped(
      title,
      amount,
    );

    _titleController.clear();
    _amountController.clear();

    Navigator.of(context).pop();
  }

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
              onSubmitted: (_) => _addButtonPressed(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _addButtonPressed(),
            ),
            Container(
              height: 44,
              width: double.infinity,
              margin: EdgeInsets.only(top: 15),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.green),
                ),
                child: Text(
                  'Add transaction',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                onPressed: _addButtonPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
