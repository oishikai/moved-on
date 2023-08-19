import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  String mail = "";
  String password = "";

//FirebaseAuthのインスタンスを生成
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future login() async {
    if (mail.isEmpty) {
      throw "メールアドレスを入力して下さい";
    }
    if (password.isEmpty) {
      throw "パスワードを入力して下さい";
    }
    final userInfo = await auth.signInWithEmailAndPassword(
      email: mail,
      password: password,
    );
  }
}
