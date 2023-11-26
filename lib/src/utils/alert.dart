import 'package:flutter/material.dart';

// TODO: const your class.
class AlertService {
  static void showAlert({
    required String title,
    // TODO: unsued code.
    // ignore: avoid-unused-parameters
    required String body,
    required VoidCallback onCancel,
    required VoidCallback onOk,
    required BuildContext context,
  }) {
    // TODO: Avoid invoking async functions in non-async blocks. Try awaiting it, wrapping in unawaited() or calling .ignore()
    // TODO: Avoid ignoring return values or specify .ignore.
    // TODO: if the constructor allows it specify the type
    // ! Example: use showDialog<void>, showDialog<Widget> etc
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        actions: [
          TextButton(
            onPressed: onOk,
            child: const Text("Confirm"),
          ),
          TextButton(
            onPressed: onCancel,
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }
}
