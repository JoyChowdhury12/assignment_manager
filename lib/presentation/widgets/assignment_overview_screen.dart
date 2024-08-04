import 'package:assignment_manager/presentation/widgets/app_background_widget.dart';
import 'package:flutter/material.dart';

import 'profile_app_bar.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar,
      body: AppBackgroundWidget(
        child: Center(
          child: Text("Overview Screen"),
        ),
      ),
    );
  }
}
