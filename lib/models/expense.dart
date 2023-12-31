import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final formatter = DateFormat.yMMMEd();

enum Category {
  food,
  entertainment,
  travel,
  education,
  work,
  miscellaneous,
}

const categoryIcons = {
  Category.education: FontAwesomeIcons.book,
  Category.entertainment: FontAwesomeIcons.film,
  Category.food: FontAwesomeIcons.utensils,
  Category.miscellaneous: FontAwesomeIcons.bagShopping,
  Category.work: FontAwesomeIcons.briefcase,
  Category.travel: FontAwesomeIcons.plane,
  // Category.education: Icon(Icons.book),
};

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

  get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount; 
    }

    return sum;
  }
}
