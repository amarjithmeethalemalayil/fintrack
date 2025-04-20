import 'package:fin_track/features/add_expenses/presentation/pages/add_expenses_page.dart';
import 'package:fin_track/features/home/presentation/pages/home_page.dart';
import 'package:fin_track/features/transaction/presentation/pages/transaction_page.dart';
import 'package:flutter/material.dart';

final List<Widget> bottomNavWidgetList = const [
  HomePage(),
  AddExpensePage(),
  TransactionPage(),
];
