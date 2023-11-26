import 'package:flutter/material.dart';

class SnackBarService {
  // TODO: const your classes.
  // ! Example: const SnackBarService._();
  // Or better.
  // ! final BuildContext context;
  // ! Example: const SnackBarService(this.context);

  // TODO: your method name can be refactored to show.
  // Tip: you can do multiple showSuccess, ShowError, etc.
  static void showSnackBar({
    required BuildContext context,
    required String message,
    // TODO: do not leave unused parameters.
    // ignore: avoid-unused-parameters
    Duration? duration,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
