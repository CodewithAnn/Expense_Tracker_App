import 'dart:ffi';

import 'package:expense_tracker/Components/chart/chart.dart';
import 'package:expense_tracker/widgets/expense_list/expense_list.dart';
import 'package:expense_tracker/widgets/new_expense..dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  void _openAddExpense() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (cntx) => NewExpense(
              onAddExpense: addExpenses,
            ));
  }

  void addExpenses(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  // method for remove expenses
  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Expense Deleted"),
      duration: const Duration(seconds: 4),
      action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expensy'),
        actions: [
          IconButton(
              onPressed: _openAddExpense,
              icon: const Icon(FontAwesomeIcons.solidSquarePlus))
        ],
      ),
      body: Column(children: [
        Chart(expenses: _registeredExpenses),
        Expanded(
          child: ExpenseList(
              expense: _registeredExpenses, onRemoveExpense: _removeExpense),
        )
      ]),
    );
  }
}
