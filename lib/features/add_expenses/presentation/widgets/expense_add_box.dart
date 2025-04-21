import 'package:flutter/material.dart';

class ExpenseAddBox extends StatelessWidget {
  final TextEditingController controller;
  const ExpenseAddBox({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;
    final fontSize = screenWidth * 0.08;
    return Container(
      height: screenHeight * 0.15,
      width: screenWidth / 1.6,
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Rs.",
              style: TextStyle(
                fontSize: fontSize,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: fontSize),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "0.00",
                  hintStyle: TextStyle(
                    fontSize: fontSize,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
