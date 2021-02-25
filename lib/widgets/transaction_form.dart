import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final Function(String, double, DateTime) onAddButtonTapped;

  TransactionForm({this.onAddButtonTapped});

  @override
  State<StatefulWidget> createState() => TransactionFormState();
}

class TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _addButtonPressed() {
    final title = _titleController.text;
    final amount = double.tryParse(_amountController.text);

    if (title.isEmpty || amount != null && amount <= 0) {
      return;
    }

    widget.onAddButtonTapped(
      title,
      amount,
      _selectedDate,
    );

    _titleController.clear();
    _amountController.clear();

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    final days = 365;
    final firstDate = DateTime.now().subtract(Duration(days: days));
    final lastDate = DateTime.now().add(Duration(days: days));
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: firstDate,
      lastDate: lastDate,
    ).then((selectedDate) {
      if (selectedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = selectedDate;
      });
    });
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
              margin: EdgeInsets.symmetric(vertical: 5),
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      DateFormat('d MMMM yyyy').format(
                        _selectedDate,
                      ),
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: _presentDatePicker,
                    child: Text(
                      'Select date',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 44,
              width: double.infinity,
              margin: EdgeInsets.only(top: 15),
              child: ElevatedButton(
                child: Text(
                  'Add transaction',
                  style: Theme.of(context).textTheme.button,
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
