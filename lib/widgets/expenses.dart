import 'package:expense_tracker/widgets/expense_list/expense_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Movie',
        amount: 250,
        date: DateTime.now(),
        category: Category.entertainment),
    Expense(
        title: 'Visit Goa',
        amount: 15000,
        date: DateTime.now(),
        category: Category.travel),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: ExpenseList(expense: _registeredExpenses),
        )
      ]),
    );
  }
}
