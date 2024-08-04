import 'package:assignment_manager/presentation/widgets/app_background_widget.dart';
import 'package:flutter/material.dart';

class ProfileUpdateScreen extends StatelessWidget {
  const ProfileUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackgroundWidget(
          child: Center(
        child: Text("Update Profile"),
      )),
    );
  }
}
