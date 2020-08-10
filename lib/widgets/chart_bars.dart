import 'package:flutter/material.dart';

class ChartBars extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPofTotal;
  ChartBars(this.label, this.spendingAmount, this.spendingPofTotal);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(
            child: Text('\$${spendingAmount.toStringAsFixed(0)}',
                style: TextStyle(color: Colors.white))),
        SizedBox(
          height: 4,
        ),
        Container(
            height: 60,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(220, 220, 220, 1),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPofTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              ],
            )),
        SizedBox(
          height: 4,
        ),
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
