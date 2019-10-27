import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final void Function(String, String) onSubmit;

  TransactionForm({@required this.onSubmit});
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
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: this._amountController,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              onPressed: () => this.onSubmit(
                this._titleController.text,
                this._amountController.text,
              ),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
