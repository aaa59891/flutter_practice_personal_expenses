import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final void Function(String, double) onSubmit;

  TransactionForm({@required this.onSubmit});

  void _onSubmit() {
    if (this._titleController.text.isEmpty ||
        this._amountController.text.isEmpty) {
      return;
    }
    this.onSubmit(
      this._titleController.text,
      double.parse(this._amountController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: this._titleController,
              onSubmitted: (_) => this._onSubmit(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: this._amountController,
              onSubmitted: (_) => this._onSubmit(),
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              onPressed: this._onSubmit,
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
