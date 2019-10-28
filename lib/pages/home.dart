import 'package:flutter/material.dart';
import 'package:my_app/models/transaction.dart';
import 'package:my_app/widgets/stateless/transaction_form.dart';
import 'package:my_app/widgets/stateless/transaction_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 'test1',
      amount: 12.2,
      date: DateTime.now(),
      title: 'first transaction',
    ),
    Transaction(
      id: 'test2',
      amount: 14.2,
      date: DateTime.now(),
      title: 'second transaction',
    ),
  ];

  void _addTransaction(String title, double amount) {
    print(title);
    this.setState(() {
      this._transactions.add(
            Transaction(
                amount: amount,
                title: title,
                date: DateTime.now(),
                id: 'test${this._transactions.length + 1}'),
          );
    });
  }

  void _showTransactionForm(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (context) {
        return TransactionForm(
          onSubmit: this._addTransaction,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('new app'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => this._showTransactionForm(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text(
                  'Chart',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            TransactionList(this._transactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => this._showTransactionForm(context),
      ),
    );
  }
}
