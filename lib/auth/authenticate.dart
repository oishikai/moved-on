import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/auth_error_dialog.dart';

class Authenticate {
  static Future<AuthErrorDialog?> signup(BuildContext context, String email, String pass) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
    } catch (e) {
      return AuthErrorDialog(error: e);
    }
    return null;
  }

  static Future<AuthErrorDialog?> logIn(BuildContext context, String email, String pass) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
    } catch (e) {
      return AuthErrorDialog(error: e);
    }
    return null;
  }
}
