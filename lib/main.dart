import 'package:flutter/material.dart';
import './transactions.dart';
import 'package:intl/intl.dart';

void main() => runApp(PEApp());

class PEApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Expenses Tracker', home: PEHomePage());
  }
}

class PEHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final amtController = TextEditingController();
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
        // crossAxisAlignment: CrossAxisAlignment.end,
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
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
            child: Column(
              children: <Widget>[
                TextField(
                    controller: titleController,
                    decoration: InputDecoration(labelText: 'Enter title')),
                TextField(
                    controller: amtController,
                    decoration: InputDecoration(labelText: 'Enter amount')),
                FlatButton(child: Text('Add Transaction', style: TextStyle(color: Colors.white),),onPressed : () {
                  print(titleController.text);
                  print(amtController.text);
                }, color: Colors.black)
              ],
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Card(
                    shadowColor: Colors.grey[200],
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Colors.green,
                              width: 1,
                            )),
                            // margin: EdgeInsets.all(5),
                            // padding: EdgeInsets.all(5),
                            // alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                '\$' + tx.amt.toString(),
                                //  textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
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
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                  child: Text(
                                DateFormat().add_yMMMd().format(tx.date),
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.grey),
                              ))
                            ],
                          )
                        ]),
                  ));
            }).toList(),
          )
        ],
      ),
    );
  }
}
