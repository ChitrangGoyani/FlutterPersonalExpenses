import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';
import './widgets/new_transaction.dart';

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
            Container(
              width: double.infinity,
              height: 100.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  color: Colors.black,
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                  shadowColor: Colors.red,
                  child: Center(
                    child: Text(
                      'Charts',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(child: FloatingActionButton(child: Icon(Icons.add) ,onPressed: () => transactionModalSheet(context), elevation: 4, backgroundColor: Colors.black), margin: EdgeInsets.all(12),),
    );
  }
}
