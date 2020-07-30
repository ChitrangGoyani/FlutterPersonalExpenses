import 'package:flutter/material.dart';
import './transactions.dart';

void main() => runApp(PEApp());

class PEApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Expenses Tracker', home: PEHomePage());
  }
}

class PEHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Transaction> transactions = [
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Expenses Tracker'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: transactions.map((tx) {
              return Container(
                  width: double.infinity,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      color: Colors.black,
                      shadowColor: Colors.red,
                      margin: EdgeInsets.all(5),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                        Container(
                          color: Colors.green,
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(5),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            tx.amt.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text(
                                tx.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white, fontSize: 18),
                              ),
                            ),
                            Container(
                                child: Text(tx.id,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white)))
                          ],
                        )
                      ]),
                    ),
                  ));
            }).toList(),
          )
        ],
      ),
    );
  }
}
