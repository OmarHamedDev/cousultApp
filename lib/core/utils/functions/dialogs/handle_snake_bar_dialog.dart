import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../styles/colors/app_colors.dart';

class HandleSnakeBarDialog {
  static void showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        duration: Duration(seconds: 3),
      ),
    );
  }

  static void showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
}

  static void showLoadingDialog(
      BuildContext context, {
        Color color = AppColors.mainColor,
        bool barrierDismissible = false,
      }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) =>
          Center(child: CircularProgressIndicator(color: color)),
    );
  }
  static Future<void> popDialog(BuildContext context ) async {
    if (context.canPop()) {
      context.pop(true);
    }
  }
}