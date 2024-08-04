import 'package:assignment_manager/presentation/utils/app_colors.dart';
import 'package:assignment_manager/presentation/screens/assignment/assignment_cancelled_screen.dart';
import 'package:assignment_manager/presentation/screens/assignment/assignment_overview_screen.dart';
import 'package:assignment_manager/presentation/screens/assignment/assignment_screen.dart';
import 'package:flutter/material.dart';

import 'assignment_completed_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentSelectedIndex = 0;
  final List<Widget> _screens = [
    const AssignmentScreen(),
    const CompletedScreen(),
    const CancelledScreen(),
    const OverviewScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.themeColor,
        currentIndex: _currentSelectedIndex,
        onTap: (index) {
          setState(() {
            _currentSelectedIndex = index;
          });
        },
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.task), label: "Assignments"),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: "Completed"),
          BottomNavigationBarItem(icon: Icon(Icons.close), label: "Canceled"),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: "Overview"),
        ],
      ),
    );
  }
}
