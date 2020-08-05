import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';
class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Column(
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
          );
  }
}