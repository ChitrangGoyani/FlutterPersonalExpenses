import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amtController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmt = double.parse(amtController.text);

    if (enteredTitle.isEmpty || enteredAmt <= 0) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmt);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
      child: Column(
        children: <Widget>[
          TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: 'Enter title'),
            onSubmitted: (_) => submitData(),
          ),
          TextField(
            controller: amtController,
            decoration: InputDecoration(labelText: 'Enter amount'),
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData(),
          ),
          FlatButton(
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: submitData,
              color: Colors.black)
        ],
      ),
    );
  }
}
