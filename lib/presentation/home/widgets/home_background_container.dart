import 'package:fin_track/core/config/my_colors/my_colors.dart';
import 'package:flutter/material.dart';

class HomeBackgroundContainer extends StatelessWidget {
  final Widget child;
  const HomeBackgroundContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
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
