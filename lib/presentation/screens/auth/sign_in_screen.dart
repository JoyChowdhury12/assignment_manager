import 'package:assignment_manager/presentation/screens/assignment/bottom_nav_screen.dart';
import 'package:assignment_manager/presentation/screens/auth/email_verify_screen.dart';
import 'package:assignment_manager/presentation/screens/auth/sign_up_screen.dart';
import 'package:assignment_manager/presentation/widgets/app_background_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../data/models/response_model.dart';
import '../../../data/network_const.dart';
import '../../../data/services/api_service.dart';
import '../../utils/toast_util.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isRegistrationInProgress = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _logIn() async {
    _isRegistrationInProgress = true;
    setState(() {});
    Map<String, dynamic> inputParams = {
      "email": _emailController.text.trim(),
      "password": _passwordController.text.trim(),
    };
    ResponseModel response = await ApiService.postRequest(
      NetworkConst.login,
      inputParams,
    );
    _isRegistrationInProgress = false;
    setState(() {});
    if (response.isSuccess) {
      if (mounted) {
        ToastUtil.showSnackBarMessage(context, "Login Successful!");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavScreen(),
          ),
        );
      }
    } else {
      if (mounted) {
        ToastUtil.showSnackBarMessage(
          context,
          "Incorrect Password! Please try again",
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
                const Gap(100),
                Text(
                  "Let's start with us!",
                  style: theme.textTheme.titleLarge,
                ),
                const Gap(18),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration:
                      const InputDecoration(hintText: "Enter your email"),
                ),
                const Gap(18),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration:
                      const InputDecoration(hintText: "Enter your password"),
                ),
                const Gap(24),
                Visibility(
                  visible: _isRegistrationInProgress == false,
                  replacement: const CircularProgressIndicator(),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _logIn();
                        }
                      },
                      child: const Text("Sign In"),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EmailVerifyScreen(),
                      ),
                    );
                  },
                  child: const Text("Forgot Password"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                      child: const Text("Sign Up"),
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
