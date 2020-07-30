import 'package:flutter/foundation.dart';
class Transaction {
   final String id;
  final String name;
  final double amt;
   final DateTime date;
  Transaction({@required this.id,@required  this.name,@required  this.amt,@required  this.date});
}
