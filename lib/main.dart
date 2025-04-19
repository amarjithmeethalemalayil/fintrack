import 'package:fin_track/presentation/home/pages/app_bottom_nav.dart';
import 'package:fin_track/presentation/home/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FinTrack',
      home: const AppBottomNav(),
    );
  }
}
