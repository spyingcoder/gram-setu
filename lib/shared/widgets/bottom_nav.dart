import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.report), label: 'Complaints'),
        BottomNavigationBarItem(
            icon: Icon(Icons.construction), label: 'Development'),
      ],
    );
  }
}
