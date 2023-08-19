import 'package:flutter/material.dart';

class AuthErrorDialog extends StatelessWidget {
  const AuthErrorDialog({Key? key, required this.error}) : super(key: key);

  final Object error;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.errorContainer,
      title: Icon(
        Icons.error,
        color: Theme.of(context).colorScheme.error,
        size: 48,
      ),
      content: Text(error.toString()),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: ElevatedButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.onError,
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('OK'),
          ),
        )
      ],
    );
  }
}
