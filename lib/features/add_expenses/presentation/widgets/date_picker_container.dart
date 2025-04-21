import 'package:fin_track/core/constants/my_colors.dart';
import 'package:flutter/material.dart';

class DatePickerContainer extends StatelessWidget {
  final TextEditingController dateController;
  final VoidCallback onTap;

  const DatePickerContainer({
    super.key,
    required this.dateController,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
        alignment: Alignment.centerLeft,
        height: 55.0,
        decoration: BoxDecoration(
          color: MyColors.white24,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: dateController,
          style: TextStyle(color: MyColors.whiteColor),
          enabled: false,
          decoration:  InputDecoration(
            hintText: "Pick Date",
            hintStyle: TextStyle(color: MyColors.lightTextColor),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}