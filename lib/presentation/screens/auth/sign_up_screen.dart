import 'package:assignment_manager/data/models/response_model.dart';
import 'package:assignment_manager/data/network_const.dart';
import 'package:assignment_manager/data/services/api_service.dart';
import 'package:assignment_manager/presentation/utils/toast_util.dart';
import 'package:assignment_manager/presentation/widgets/app_background_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isRegistrationInProgress = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    _isRegistrationInProgress = true;
    setState(() {});
    Map<String, dynamic> inputParams = {
      "name": _fullNameController.text.trim(),
      "email": _emailController.text.trim(),
      "password": _passwordController.text.trim(),
      "password_confirmation": _passwordController.text.trim()
    };
    ResponseModel response = await ApiService.postRequest(
      NetworkConst.registration,
      inputParams,
    );
    _isRegistrationInProgress = false;
    setState(() {});
    if (response.isSuccess) {
      if (mounted) {
        ToastUtil.showSnackBarMessage(
            context, "Registration Success! Please login.");
        Navigator.pop(context);
      }
    } else {
      if (mounted) {
        ToastUtil.showSnackBarMessage(
          context,
          "Registration failed! Please try again.",
          isErrorMessage: true,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: AppBackgroundWidget(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Gap(50),
                Text("Join with us!", style: theme.textTheme.titleLarge),
                const Gap(18),
                TextFormField(
                  controller: _fullNameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(hintText: "Your full name"),
                  validator: (String? value) {
                    if (value!.trim().isEmpty) {
                      return 'Enter your full name';
                    }
                    return null;
                  },
                ),
                // const Gap(18),
                // TextFormField(
                //   controller: _lastNameController,
                //   keyboardType: TextInputType.text,
                //   decoration: const InputDecoration(hintText: "Your last name"),
                // ),
                // const Gap(18),
                // TextFormField(
                //   controller: _mobileController,
                //   keyboardType: TextInputType.phone,
                //   decoration:
                //       const InputDecoration(hintText: "Your mobile number"),
                // ),
                const Gap(18),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration:
                      const InputDecoration(hintText: "Enter your email"),
                  validator: (String? value) {
                    if (value!.trim().isEmpty) {
                      return 'Enter your email';
                    }
                    return null;
                  },
                ),
                const Gap(18),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Enter your password"),
                  validator: (String? value) {
                    if (value!.trim().isEmpty) {
                      return 'Enter your password';
                    }
                    if (value.length <= 6) {
                      return 'Password should be more than 6 characters';
                    }
                    return null;
                  },
                ),
                const Gap(24),
                Visibility(
                  visible: _isRegistrationInProgress == false,
                  replacement: Center(
                    child: CircularProgressIndicator(),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _signUp();
                        }
                      },
                      child: const Text("Sign Up"),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an Account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Sign In"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
