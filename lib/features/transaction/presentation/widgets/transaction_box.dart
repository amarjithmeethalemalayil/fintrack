import 'package:fin_track/core/constants/my_colors.dart';
import 'package:flutter/material.dart';

class TransactionBox extends StatelessWidget {
  const TransactionBox({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      color: MyColors.white24,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: size.width / 18,
        ),
        title: Text(
          'Transaction',
          style:  TextStyle(color: MyColors.whiteColor),
        ),
        subtitle:  Text(
          'Details here',
          style: TextStyle(color: MyColors.lightTextColor),
        ),
        trailing: Text(
          '- ₹250',
          style: TextStyle(
            color: MyColors.redColor,
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.height * 0.02,
          ),
        ),
      ),
    );
  }
}
