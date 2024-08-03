import 'package:assignment_manager/presentation/utils/app_colors.dart';
import 'package:assignment_manager/presentation/widgets/app_background_widget.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentSelectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackgroundWidget(child: Container()),
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
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Assignments"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Completed"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Canceled"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Overview"),
        ],
      ),
    );
  }
}
