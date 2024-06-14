import 'package:flutter/material.dart';
import 'package:smart_home/utils/app_text_style.dart';

class UtilityFunctions {
  static void showSnackBar({
    required BuildContext context,
    required String message,
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: AppTextStyle.urbanistW900,
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: backgroundColor ?? Colors.blue,
      ),
    );
  }
}
