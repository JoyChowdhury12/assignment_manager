import 'package:assignment_manager/presentation/utils/app_colors.dart';
import 'package:assignment_manager/presentation/widgets/app_background_widget.dart';
import 'package:flutter/material.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Update Profile",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontSize: 22,
              ),
        ),
      ),
      body: AppBackgroundWidget(
          child: Center(
        child: Text("Update Profile"),
      )),
    );
  }
}
