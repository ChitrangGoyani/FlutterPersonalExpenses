import 'package:flutter/material.dart';
import './widgets/user_transaction.dart';


void main() => runApp(PEApp());

class PEApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Expenses Tracker', home: PEHomePage());
  }
}

class PEHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Expenses Tracker'),
      ),
      body: Column(
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
          UserTransactions(),
        ],
      ),
    );
  }
}
