import 'package:assignment_manager/presentation/widgets/app_background_widget.dart';
import 'package:assignment_manager/presentation/widgets/profile_app_bar.dart';
import 'package:flutter/material.dart';

class CancelledScreen extends StatelessWidget {
  const CancelledScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar,
      body: AppBackgroundWidget(
        child: Center(
          child: Text("Cancelled Screen"),
        ),
      ),
    );
  }
}
