import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/models/transaction.dart';
import 'package:my_app/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> transactions;
  Chart(this.transactions);
  double foldSumAmount(double pre, Transaction acc) {
    return pre + acc.amount;
  }

  List<TransactionBarData> get groupedTransactionValues {
    double sumAmount = this.transactions.isEmpty
        ? 0
        : this.transactions.fold(0.0, this.foldSumAmount);
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      final dayTransactions = this.transactions.where((transaction) =>
          transaction.date.day == weekDay.day &&
          transaction.date.month == weekDay.month &&
          transaction.date.year == weekDay.year);

      double dayAmount = dayTransactions.isEmpty
          ? 0
          : dayTransactions.fold<double>(0.0, this.foldSumAmount);

      return TransactionBarData(
        dayLabel: DateFormat.E().format(weekDay),
        amount: dayAmount,
        percentage: sumAmount == 0 ? 0 : dayAmount / sumAmount,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: this
              .groupedTransactionValues
              .reversed
              .map(
                (bar) => Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(bar),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class TransactionBarData {
  final String dayLabel;
  final double amount;
  final double percentage;
  TransactionBarData({this.dayLabel, this.amount, this.percentage});
}
