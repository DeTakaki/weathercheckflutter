import 'package:flutter/material.dart';
import 'package:weather_checking/constants/sizes.dart';
import 'package:weather_checking/main.dart';

class CustomSnackBar {
  static void showSnackBar({
    Color? backgroundColor,
    Color borderSideColor = const Color(0xFF000000),
    IconData? icon,
    Color iconColor = const Color(0xFF000000),
    String message = '',
    Color messageColor = const Color(0xFF000000),
    Duration duration = const Duration(seconds: 3),
  }) {
    if (rootScaffoldMessengerKey.currentState != null) {
      rootScaffoldMessengerKey.currentState!.showSnackBar(
        SnackBar(
          duration: duration,
          elevation: 6.0,
          backgroundColor: backgroundColor,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: borderSideColor,
              width: 0.3,
            ),
            borderRadius: BorderRadius.circular(Sizes.p8),
          ),
          content: Row(
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: iconColor,
                  size: Sizes.p24,
                ),
              gapW12,
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(
                    color: messageColor,
                    fontWeight: FontWeight.w600,
                    fontSize: Sizes.p16,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
