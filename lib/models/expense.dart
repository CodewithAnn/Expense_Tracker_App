import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {
  food,
  entertainment,
  travel,
  education,
  work,
  miscellaneous,
}

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : iD = uuid.v4();

  final String title;
  final String iD;
  final double amount;
  final DateTime date;
  final Category category;
}
