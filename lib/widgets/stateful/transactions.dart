import 'package:flutter/material.dart';
import 'package:my_app/models/transaction.dart';
import 'package:my_app/widgets/stateless/transaction_form.dart';
import 'package:my_app/widgets/stateless/transaction_list.dart';

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
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
    Transaction(
      id: 'test2',
      amount: 14.2,
      date: DateTime.now(),
      title: 'second transaction',
    ),
    Transaction(
      id: 'test2',
      amount: 15.2,
      date: DateTime.now(),
      title: 'second transaction',
    ),
    Transaction(
      id: 'test2',
      amount: 16.2,
      date: DateTime.now(),
      title: 'second transaction',
    ),
    Transaction(
      id: 'test2',
      amount: 16.2,
      date: DateTime.now(),
      title: 'second transaction',
    ),
    Transaction(
      id: 'test2',
      amount: 16.2,
      date: DateTime.now(),
      title: 'second transaction',
    ),
    Transaction(
      id: 'test2',
      amount: 16.2,
      date: DateTime.now(),
      title: 'second transaction',
    ),
  ];

  void _addTransaction(String title, double amount) {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionForm(
          onSubmit: this._addTransaction,
        ),
        TransactionList(this._transactions),
      ],
    );
  }
}
