import 'package:flutter/material.dart';
import 'package:my_app/widgets/chart.dart';

class ChartBar extends StatelessWidget {
  final TransactionBarData txData;
  ChartBar(this.txData);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          this.txData.amount.toStringAsFixed(2),
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 4),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: this.txData.percentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Text(this.txData.dayLabel.substring(0, 1)),
      ],
    );
  }
}
