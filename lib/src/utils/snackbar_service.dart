import 'package:flutter/material.dart';

class SnackBarService {
  static void showSnackBar({
    required BuildContext context,
    required String message,
    Duration? duration,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
