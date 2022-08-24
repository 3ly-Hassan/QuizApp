import 'package:flutter/material.dart';

class Dialogs {
  static final Dialogs _singleton = Dialogs._internal();
  Dialogs._internal();
  factory Dialogs() {
    return _singleton;
  }

  static Widget questionStartDialog({required VoidCallback onTap}) {
    return AlertDialog(
      title: const Text('Hi..'),
      content: const Text('please login before you start'),
      actions: [
        TextButton(
          onPressed: onTap,
          child: const Text('okay'),
        ),
      ],
    );
  }
}
