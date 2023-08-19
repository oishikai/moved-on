import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthErrorDialog extends StatelessWidget {
  const AuthErrorDialog({Key? key, required this.error}) : super(key: key);

  final error;

  @override
  Widget build(BuildContext context) {
    String message = '';

    if (error is FirebaseAuthException) {
      switch ((error as FirebaseAuthException).code) {
        case 'invalid-email':
          message = 'メールアドレスが不正です';
          break;
        case 'user-disabled':
          message = 'ユーザーが無効です';
          break;
        case 'user-not-found':
          message = 'ユーザーが見つかりません';
          break;
        case 'wrong-password':
          message = 'パスワードが間違っています';
          break;
        case 'email-already-in-use':
          message = 'メールアドレスは既に使用されています';
          break;
        case 'operation-not-allowed':
          message = 'この操作は許可されていません';
          break;
        case 'weak-password':
          message = 'パスワードが弱すぎます';
          break;
        default:
          message = 'エラーが発生しました';
      }
    } else {
      message = 'エラーが発生しました';
    }

    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.errorContainer,
      title: Icon(
        Icons.error,
        color: Theme.of(context).colorScheme.error,
        size: 48,
      ),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onErrorContainer,
          fontSize: 16,
        ),
      ),
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
