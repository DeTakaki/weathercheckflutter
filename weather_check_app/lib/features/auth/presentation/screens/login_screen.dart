import 'package:flutter/material.dart';
import 'package:weather_checking/constants/sizes.dart';
import 'package:weather_checking/core/presentation/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                    title: 'Login',
                    textController: loginController,
                    validator: (text) {
                      if (text != null) {
                        return text.isEmpty
                            ? 'Please provide your login information'
                            : null;
                      }
                      return 'Please provide your login information';
                    }),
                gapH8,
                CustomTextField(
                    title: 'Password',
                    textController: passwordController,
                    obscureFields: true,
                    validator: (text) => null),
                gapH16,
                SizedBox(
                  height: Sizes.p64,
                  width: double.infinity,
                  child: ElevatedButton.icon(
                      onPressed: () {
                        _formKey.currentState?.validate();
                      },
                      iconAlignment: IconAlignment.end,
                      icon: Icon(Icons.arrow_right_alt_rounded),
                      label: const Text('LOGIN')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
