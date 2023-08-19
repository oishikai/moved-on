import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moved_on/pages/auth/reset_password_page.dart';
import 'package:moved_on/providers/user.dart';

import '../pages/auth/login_page.dart';
import '../pages/auth/signup_page.dart';
import '../pages/home_page.dart';
import '../pages/next_page.dart';

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
        path: '/reset_password',
        builder: (context, state) => const ResetPasswordPage(),
      ),
      GoRoute(
        path: '/next',
        builder: (context, state) => const NextPage(),
      )
    ],
    redirect: (context, state) {
      // 認証関連のページはリダイレクトしない
      if (state.matchedLocation == '/login' || state.matchedLocation == '/signup' || state.matchedLocation == '/reset_password') {
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
