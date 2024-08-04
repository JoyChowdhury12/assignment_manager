import 'package:assignment_manager/presentation/widgets/app_background_widget.dart';
import 'package:assignment_manager/presentation/widgets/profile_app_bar.dart';
import 'package:flutter/material.dart';

class AssignmentScreen extends StatelessWidget {
  const AssignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar,
      body: const AppBackgroundWidget(
        child: Center(
          child: Text("Assignment Screen"),
        ),
      ),
    );
  }
}
