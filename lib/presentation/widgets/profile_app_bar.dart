import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_colors.dart';

PreferredSizeWidget get profileAppBar {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: AppColors.themeColor,
    title: const Row(
      children: [
        CircleAvatar(
          radius: 20,
        ),
        Gap(16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Joy Chowdhury",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            Text(
              "jroy2181@gmail.com",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ],
        ),
      ],
    ),
  );
}
