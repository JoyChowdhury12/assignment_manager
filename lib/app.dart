import 'package:assignment_manager/presentation/screens/splash_screen.dart';
import 'package:assignment_manager/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AssignmentManagerApp extends StatelessWidget {
  const AssignmentManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Assignment Manager",
      home: const SplashScreen(),
      theme: ThemeData(
        fontFamily: 'Roboto',
        inputDecorationTheme: InputDecorationTheme(
          fillColor: const Color(0x75FAEAB4),
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              backgroundColor: AppColors.themeColor,
              foregroundColor: Colors.white),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: AppColors.themeColor,
              textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
