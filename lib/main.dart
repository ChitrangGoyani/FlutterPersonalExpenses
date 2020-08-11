import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './widgets/charts.dart';
import './models/transactions.dart';
import 'dart:math';


void main() => runApp(PEApp());

class PEApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Expenses Tracker', home: PEHomePage());
  }
}

class PEHomePage extends StatefulWidget {
  @override
  _PEHomePageState createState() => _PEHomePageState();
}

class _PEHomePageState extends State<PEHomePage> {

   final List<Transaction> _userTransactions = [
    //  Transaction(
    //     id: '001',
    //     name: 'Shoes',
    //     amt: 59.99,
    //     date: DateTime.now(),
    //   ),
    //   Transaction(
    //     id: '002',
    //     name: 'Groceries',
    //     amt: 16.99,
    //     date: DateTime.now(),
    //   )
  ];

  List<Transaction> get _recentTransactions{
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }
  Random random = new Random();
  void _addNewTransactions(String txTitle, double txAmt, DateTime chosenDate){
    final newTx = Transaction(name: txTitle, amt: txAmt, date: chosenDate, id: random.nextInt(100).toString());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void transactionModalSheet(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (_) {
      return NewTransaction(_addNewTransactions);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Expenses Tracker'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () => transactionModalSheet(context))
        ],
      ),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Charts(_recentTransactions),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(child: FloatingActionButton(child: Icon(Icons.add) ,onPressed: () => transactionModalSheet(context), elevation: 4, backgroundColor: Colors.black), margin: EdgeInsets.all(12),),
    );
  }
}
