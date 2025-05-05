import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_checking/constants/app_colors.dart';
import 'package:weather_checking/constants/sizes.dart';
import 'package:weather_checking/core/presentation/widgets/custom_text_field.dart';
import 'package:weather_checking/routing/routes_strings.dart';

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

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.goNamed(RoutesStrings.mainScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceColor,
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('./assets/icons/app_logo.svg'),
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
                    validator: (text) {
                      if (text != null) {
                        return text.isEmpty
                            ? 'Please provide your password'
                            : null;
                      }
                      return 'Please provide your login password';
                    }),
                gapH16,
                SizedBox(
                  height: Sizes.p64,
                  width: double.infinity,
                  child: ElevatedButton.icon(
                      onPressed: _submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.backgroundColor,
                      ),
                      iconAlignment: IconAlignment.end,
                      icon: const Icon(
                        Icons.arrow_right_alt_rounded,
                        color: AppColors.accentColor,
                      ),
                      label: const Text(
                        'LOGIN',
                        style: TextStyle(color: AppColors.textColor),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
