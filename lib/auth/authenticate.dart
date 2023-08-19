import 'package:firebase_auth/firebase_auth.dart';

enum AuthResultStatus {
  weakPassword('パスワードが簡単すぎます'),
  emailAlreadyInUse('すでに使用されているメールアドレスです'),
  invalidEmail('メールアドレスが無効です'),
  userNotFound('ユーザーが存在しません'),
  wrongPassword('パスワードが間違っています'),
  unknown('不明なエラーです');

  final String message;
  const AuthResultStatus(this.message);
}

class Authenticate {
  static void createAccount(String email, String pass) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      print('アカウント作成成功');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthResultStatus.weakPassword;
      } else if (e.code == 'email-already-in-use') {
        throw AuthResultStatus.emailAlreadyInUse;
      }
    } catch (e) {
      throw AuthResultStatus.unknown;
    }
  }

  static void logIn(String email, String pass) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      print('サインイン成功');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        throw AuthResultStatus.invalidEmail;
      } else if (e.code == 'user-not-found') {
        throw AuthResultStatus.userNotFound;
      } else if (e.code == 'wrong-password') {
        throw AuthResultStatus.wrongPassword;
      } else {
        throw AuthResultStatus.unknown;
      }
    }
  }
}
