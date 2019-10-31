import 'package:flutter/material.dart';
import 'package:my_app/widgets/chart.dart';

class ChartBar extends StatelessWidget {
  final TransactionBarData txData;
  ChartBar(this.txData);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: <Widget>[
            Container(
              height: constraints.maxHeight * .15,
              child: Text(
                this.txData.amount.toStringAsFixed(2),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: constraints.maxHeight * .05),
            Container(
              height: constraints.maxHeight * .6,
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
            SizedBox(
              height: constraints.maxHeight * .05,
            ),
            Container(
              height: constraints.maxHeight * .15,
              child: Text(this.txData.dayLabel.substring(0, 1)),
            ),
          ],
        );
      },
    );
  }
}
