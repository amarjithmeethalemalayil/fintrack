import 'package:fin_track/app/pages/bottom_nav_widget_list.dart';
import 'package:flutter/material.dart';

class AppBottomNav extends StatefulWidget {
  const AppBottomNav({super.key});

  @override
  State<AppBottomNav> createState() => _AppBottomNavState();
}

class _AppBottomNavState extends State<AppBottomNav> {
  int _selectedIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: bottomNavWidgetList[_selectedIndex],
      floatingActionButton: Container(
        margin: EdgeInsets.all(10),
        height: size.height / 15,
        width: size.width / 1.8,
        decoration: BoxDecoration(
          color: const Color.fromARGB(60, 0, 0, 0),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => _onTabTapped(0),
              child: Icon(
                Icons.home,
                size: size.height / 25,
                color: _selectedIndex == 0 ? Colors.white : Colors.white54,
              ),
            ),
            GestureDetector(
              onTap: () => _onTabTapped(1),
              child: Icon(
                Icons.add_box_rounded,
                size: size.height / 25,
                color: _selectedIndex == 1 ? Colors.white : Colors.white54,
              ),
            ),
            GestureDetector(
              onTap: () => _onTabTapped(2),
              child: Icon(
                Icons.pages,
                size: size.height / 25,
                color: _selectedIndex == 2 ? Colors.white : Colors.white54,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
