import 'package:fin_track/core/constants/my_colors.dart';
import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget child;
  const BackgroundContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      padding: EdgeInsets.symmetric(
        horizontal: size.width / 15,
        vertical: size.height / 35,
      ).copyWith(bottom: 0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: MyColors.homeDradientColor,
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: child,
    );
  }
}
