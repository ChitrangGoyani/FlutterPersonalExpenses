import 'dart:math';

import 'package:flutter/material.dart';
import './transaction_list.dart';
import './new_transaction.dart';
import '../models/transactions.dart';
class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}
class _UserTransactionsState extends State<UserTransactions> {
    final List<Transaction> _userTransactions = [
     Transaction(
        id: '001',
        name: 'Shoes',
        amt: 59.99,
        date: DateTime.now(),
      ),
      Transaction(
        id: '002',
        name: 'Groceries',
        amt: 16.99,
        date: DateTime.now(),
      )
  ];
  Random random = new Random();
  void _addNewTransactions(String txTitle, double txAmt){
    final newTx = Transaction(name: txTitle, amt: txAmt, date: DateTime.now(), id: random.nextInt(100).toString());
    setState(() {
      _userTransactions.add(newTx);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
       NewTransaction(_addNewTransactions),
       TransactionList(_userTransactions),
    ],
    );
  }
}