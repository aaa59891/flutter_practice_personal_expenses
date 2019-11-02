import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm({@required this.onSubmit});

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  DateTime _pickDate;

  void _onSubmit() {
    if (this._titleController.text.isEmpty ||
        this._amountController.text.isEmpty ||
        this._pickDate == null) {
      return;
    }
    this.widget.onSubmit(
          this._titleController.text,
          double.parse(this._amountController.text),
          this._pickDate,
        );
    Navigator.of(this.context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: this.context,
      initialDate: this._pickDate ?? DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date == null) {
        return;
      }
      setState(() {
        this._pickDate = date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
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
                    Expanded(
                      child: Text(
                        this._pickDate == null
                            ? 'No date choosen!'
                            : 'Pick date: ${DateFormat.yMMMd().format(this._pickDate)}',
                      ),
                    ),
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: this._showDatePicker,
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
      ),
    );
  }
}
