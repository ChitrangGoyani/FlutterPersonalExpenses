import 'package:flutter/material.dart';
class NewTransaction extends StatelessWidget {
    final titleController = TextEditingController();
    final amtController = TextEditingController();
    final Function addTx;
    NewTransaction(this.addTx);
  @override
  Widget build(BuildContext context) {
    return Container(
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
                 addTx(titleController.text, double.parse(amtController.text));
                }, color: Colors.black)
              ],
            ),
    );
  }
}