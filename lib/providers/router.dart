import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moved_on/providers/user.dart';

import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/next_page.dart';
import '../pages/signup_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final user = ref.watch(userProvider);
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: '/next',
        builder: (context, state) => const NextPage(),
      )
    ],
    redirect: (context, state) {
      // ログイン画面とサインアップ画面はリダイレクトしない
      if (state.matchedLocation == '/login' || state.matchedLocation == '/signup') {
        return null;
      }

      if (user.value == null) {
        return '/login';
      }
      return null;
    },
  );
});
//bokuchan.kai@gmail.com
