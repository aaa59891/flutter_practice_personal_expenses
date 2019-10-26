import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/components/transactionForm.dart';
import 'package:my_app/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Transaction> transactions = [
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
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('new app'),
          ),
          body: Column(
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
              TransactionForm(),
              Column(
                children: transactions
                    .map((transaction) => Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.purple,
                                    width: 2,
                                  ),
                                ),
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  "\$${transaction.amount.toString()}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.purple,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    transaction.title,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    DateFormat.yMMMd().format(transaction.date),
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ))
                    .toList(),
              )
            ],
          )),
    );
  }
}
