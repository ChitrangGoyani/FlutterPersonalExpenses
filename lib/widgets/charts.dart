import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transactions.dart';
import 'package:personal_expenses/widgets/chart_bars.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';

class Charts extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Charts(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var amountTotal = 0.00;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year)
          amountTotal += recentTransactions[i].amt;
      }
      return {
        'day': DateFormat.E().format(weekDay),
        'amount': amountTotal,
      };
    });
  }

  double get totalWeekSpending {
    return groupedTransactions.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          color: Colors.black,
          elevation: 5,
          margin: EdgeInsets.all(10),
          shadowColor: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: groupedTransactions.map((ctxs) {
              return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBars(ctxs['day'], ctxs['amount'],
                      totalWeekSpending == 0.0 ? 0.0 : (ctxs['amount'] as double) / totalWeekSpending));
            }).toList()),
          ),
        ),
      ),
    );
  }
}
