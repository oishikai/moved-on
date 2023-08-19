import 'package:firebase_auth/firebase_auth.dart';

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
        print('パスワードが弱すぎます');
      } else if (e.code == 'email-already-in-use') {
        print('すでに使用されているメールアドレスです');
      } else {
        print('アカウント作成エラー');
      }
    } catch (e) {
      print(e);
    }
  }

  static void logIn(String email, String pass) async {
    try {
      /// credential にはアカウント情報が記録される
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      print('サインイン成功');
    }

    /// サインインに失敗した場合のエラー処理
    on FirebaseAuthException catch (e) {
      /// メールアドレスが無効の場合
      if (e.code == 'invalid-email') {
        print('メールアドレスが無効です');
      }

      /// ユーザーが存在しない場合
      else if (e.code == 'user-not-found') {
        print('ユーザーが存在しません');
      }

      /// パスワードが間違っている場合
      else if (e.code == 'wrong-password') {
        print('パスワードが間違っています');
      }

      /// その他エラー
      else {
        print('サインインエラー');
      }
    }
  }
}
