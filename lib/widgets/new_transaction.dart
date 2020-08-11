import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amtController = TextEditingController();
  DateTime _selectedDate;

  void submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmt = double.parse(_amtController.text);

    if (enteredTitle.isEmpty || enteredAmt <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmt, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker(){
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: null, lastDate: DateTime.now()).then((pickedDate) {
      if(pickedDate == null){
        return;
      }
      setState(() {
      _selectedDate = pickedDate;  
      });
    } );
    }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Enter title'),
            onSubmitted: (_) => submitData(),
          ),
          TextField(
            controller: _amtController,
            decoration: InputDecoration(labelText: 'Enter amount'),
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData(),
          ),
          Container(
            height: 70,
            child: Row(
              children: <Widget>[
                Text(_selectedDate == null ? 'No date chosen' : DateFormat.yMd().format(_selectedDate)),
                FlatButton(
                  child: Text('Choose Date'),
                  onPressed: _presentDatePicker,
                ),
              ],
            ),
          ),
          RaisedButton(
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
