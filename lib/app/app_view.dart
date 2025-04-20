import 'package:fin_track/app/pages/app_bottom_nav.dart';
import 'package:flutter/material.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FinTrack',
      home: const AppBottomNav(),
    );
  }
}
