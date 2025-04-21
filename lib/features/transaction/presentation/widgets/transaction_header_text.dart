import 'package:fin_track/core/constants/my_colors.dart';
import 'package:flutter/material.dart';

class TransactionHeaderText extends StatelessWidget {
  const TransactionHeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Text(
      "Transactions",
      style: TextStyle(
        fontSize: size.width * 0.06,
        fontWeight: FontWeight.bold,
        color: MyColors.whiteColor,
      ),
    );
  }
}
