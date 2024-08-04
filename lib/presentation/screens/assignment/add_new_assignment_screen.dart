import 'package:assignment_manager/presentation/widgets/profile_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddNewAssignmentScreen extends StatefulWidget {
  const AddNewAssignmentScreen({super.key});

  @override
  State<AddNewAssignmentScreen> createState() => _AddNewAssignmentScreenState();
}

class _AddNewAssignmentScreenState extends State<AddNewAssignmentScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(45),
              Text("Create New Assignment",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 24)),
              Gap(16),
              TextFormField(
                decoration: InputDecoration(hintText: "Enter Title"),
              ),
              Gap(16),
              TextFormField(
                  maxLines: 7,
                  decoration: InputDecoration(hintText: "Enter Description")),
              Gap(16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {}, child: Text("Create New Assignment")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
