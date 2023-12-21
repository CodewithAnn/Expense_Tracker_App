import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Expense {
  Expense({required this.title, required this.amount, required this.date})
      : iD = uuid.v4();

  final String title;
  final String iD;
  final double amount;
  final DateTime date;
}
