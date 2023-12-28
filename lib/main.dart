import 'package:expense_tracker/Components/Theme/ktheme.dart';
import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: kThemeData,
      darkTheme: kDarkTheme,
      debugShowCheckedModeBanner: false,
      home: const Expenses(),
    ),
  );
}
