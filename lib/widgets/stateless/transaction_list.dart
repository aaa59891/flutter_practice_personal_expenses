import 'package:flutter/material.dart';
import 'package:my_app/models/transaction.dart';
import 'package:my_app/widgets/stateless/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return TransactionItem(
            transaction: this.transactions[index],
          );
        },
        itemCount: this.transactions.length,
        // children: this
        //     .transactions
        //     .map((transaction) => TransactionItem(
        //           transaction: transaction,
        //         ))
        //     .toList(),
      ),
    );
  }
}
