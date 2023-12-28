import 'dart:ffi';

import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _textController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.miscellaneous;

  // async function for  picks date
  void _selectDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(
      now.day,
      now.month,
      now.year - 1,
    );

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  // method for showing error messages
  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsinvalid = enteredAmount == null || enteredAmount <= 0;
    if (_textController.text.trim().isEmpty ||
        amountIsinvalid ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (cntx) => AlertDialog(
                title: const Text("Invalid input"),
                content: const Text(
                    "Please entered valid title, amount , date and category was entered"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(cntx);
                      },
                      child: const Text("Okay"))
                ],
              ));
      return;
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          TextField(
            controller: _textController,
            maxLength: 35,
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  // maxLength: 10,
                  decoration: const InputDecoration(
                    label: Text("Amount"),
                  ),
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(_selectedDate == null
                        ? " No Selected Date"
                        : formatter.format(_selectedDate!)),
                    IconButton(
                        onPressed: _selectDatePicker,
                        icon: const Icon(FontAwesomeIcons.calendarDays))
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name.toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              ElevatedButton(
                onPressed: _submitExpenseData,
                child: const Text("Save Expense"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
