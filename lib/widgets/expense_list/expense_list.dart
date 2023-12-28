import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expense_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expense,
    required this.onRemoveExpense
  });
  final void Function(Expense expense) onRemoveExpense;
  final List<Expense> expense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expense.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expense[index]),
        onDismissed: (direction) => onRemoveExpense(expense[index]),
        child: ExpenseItem(expense[index]),
      ),
    );
  }
}
