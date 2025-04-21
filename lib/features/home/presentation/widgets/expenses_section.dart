import 'package:fin_track/core/constants/my_colors.dart';
import 'package:flutter/material.dart';

class ExpensesSection extends StatelessWidget {
  const ExpensesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(size.width * 0.04),
      decoration: BoxDecoration(
        color: MyColors.homeCardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Available Balance",
            style: TextStyle(
              fontSize: size.width * 0.045,
              fontWeight: FontWeight.w400,
              color: MyColors.lightTextColor,
            ),
          ),
          Text(
            "Rs.5000",
            style: TextStyle(
              fontSize: size.width * 0.10,
              fontWeight: FontWeight.bold,
              color: MyColors.whiteColor,
            ),
          ),
          SizedBox(height: size.width * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildIncomeExpensesSection(
                size: size,
                purpose: "Income",
                value: "1000",
              ),
              _buildIncomeExpensesSection(
                size: size,
                purpose: "Expenses",
                value: "1000",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIncomeExpensesSection({
    required Size size,
    required String purpose,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          purpose,
          style: TextStyle(
            fontSize: size.width * 0.045,
            fontWeight: FontWeight.w500,
            color: MyColors.lightTextColor,
          ),
        ),
        Text(
          "Rs.$value",
          style: TextStyle(
            fontSize: size.width * 0.06,
            fontWeight: FontWeight.bold,
            color: MyColors.whiteColor,
          ),
        ),
      ],
    );
  }
}
