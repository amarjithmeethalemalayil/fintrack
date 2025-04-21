import 'package:flutter/material.dart';

class AddExpenseButton extends StatelessWidget {
  const AddExpenseButton({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;
    final fontSize = screenWidth * 0.08;
    return Container(
      width: screenWidth * 0.6,
      height: screenHeight * 0.08,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          "Add Expense",
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize * 0.6,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
