
import 'package:flutter/material.dart';

class Log_out extends StatelessWidget {
  final VoidCallback onTap;

  const Log_out({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text("Logout Confirm"),
        content: const Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel")),
          TextButton(
              onPressed: onTap,
              child: const Text("Logout"))
        ]);
  }
}