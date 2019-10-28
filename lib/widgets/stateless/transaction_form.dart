import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm({@required this.onSubmit});

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  void _onSubmit() {
    if (this._titleController.text.isEmpty ||
        this._amountController.text.isEmpty) {
      return;
    }
    this.widget.onSubmit(
          this._titleController.text,
          double.parse(this._amountController.text),
        );
    Navigator.of(this.context).pop();
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
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Text('No date choosen!'),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text('Add Transaction'),
              onPressed: this._onSubmit,
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
            )
          ],
        ),
      ),
    );
  }
}
