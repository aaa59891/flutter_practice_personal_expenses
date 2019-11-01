import 'package:flutter/material.dart';
import 'package:my_app/models/transaction.dart';
import 'package:my_app/widgets/chart.dart';
import 'package:my_app/widgets/transaction_form.dart';
import 'package:my_app/widgets/transaction_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> _transactions = [
    // Transaction(
    //   id: 'test1',
    //   amount: 12.2,
    //   date: DateTime.now(),
    //   title: 'first transaction',
    // ),
    // Transaction(
    //   id: 'test2',
    //   amount: 14.2,
    //   date: DateTime.now().subtract(Duration(days: 1)),
    //   title: 'second transaction',
    // ),
  ];
  bool _isSwitchOn = false;

  void _addTransaction(
    String title,
    double amount,
    DateTime date,
  ) {
    print(title);
    this.setState(() {
      this._transactions.add(
            Transaction(
                amount: amount,
                title: title,
                date: date,
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

  Function onDelete(String id) {
    return () {
      this.setState(() {
        this._transactions.removeWhere((tx) => tx.id == id);
      });
    };
  }

  List<Transaction> get _recentTransactions {
    final dayAfter = DateTime.now().subtract(Duration(days: 7));
    return this._transactions.where((tx) => tx.date.isAfter(dayAfter)).toList();
  }

  final now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('new app'),
      centerTitle: false,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => this._showTransactionForm(context),
        )
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height) *
                  .2,
              child: Row(
                children: <Widget>[
                  Text('Show chart'),
                  Switch(
                    value: this._isSwitchOn,
                    onChanged: (value) {
                      this.setState(() {
                        this._isSwitchOn = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height) *
                  .8,
              child: this._isSwitchOn
                  ? Chart(this._recentTransactions)
                  : TransactionList(this._transactions, this.onDelete),
            ),
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
