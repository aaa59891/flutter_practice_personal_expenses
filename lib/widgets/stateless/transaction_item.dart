import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final Function Function(String) onDelete;
  TransactionItem({
    @required this.transaction,
    @required this.onDelete,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          child: FittedBox(
            child: Text(
              "\$${transaction.amount.toStringAsPrecision(2)}",
            ),
          ),
        ),
        title: Text(
          this.transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: this.onDelete(this.transaction.id),
        ),
      ),
    );
  }
}
