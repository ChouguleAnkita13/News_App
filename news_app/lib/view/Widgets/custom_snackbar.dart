import 'package:flutter/material.dart';

class CustomSnackbar {
  static void showCustomSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor:
            message.contains("Login") ? Colors.green[400] : Colors.red[200]!,
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
