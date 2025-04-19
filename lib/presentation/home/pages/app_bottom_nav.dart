import 'package:fin_track/presentation/home/pages/home_page.dart';
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

  final List<Widget> _pages = const [
    HomePage(),
    Center(child: Text('Add')),
    Center(child: Text('Pages')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: AppbarModel(
          selectedIndex: _selectedIndex,
          onTap: _onTabTapped,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class AppbarModel extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const AppbarModel({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          height: screenWidth / 7,
          margin: const EdgeInsets.symmetric(horizontal: 60),
          decoration: BoxDecoration(
            color: const Color.fromARGB(60, 0, 0, 0),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: selectedIndex == 0 ? Colors.white : Colors.white54,
                ),
                onPressed: () => onTap(0),
              ),
              IconButton(
                icon: Icon(
                  Icons.add,
                  color: selectedIndex == 1 ? Colors.white : Colors.white54,
                ),
                onPressed: () => onTap(1),
              ),
              IconButton(
                icon: Icon(
                  Icons.pages,
                  color: selectedIndex == 1 ? Colors.white : Colors.white54,
                ),
                onPressed: () => onTap(2),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
