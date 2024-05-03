import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:new_project/features/auth/presentation/views/sign_in_view.dart';
import 'package:new_project/features/auth/presentation/views/sign_up_view.dart';
import 'package:new_project/features/home/presentation/views/home_view.dart';
import 'package:new_project/features/home/presentation/views/chats_view.dart';
import 'package:new_project/features/splash/presentation/views/splash_view.dart';

abstract class AppRoutes {
  static const kHomeView = '/homeView';
  static const kSignInView = '/signInView';
  static const kSignUpView = '/SignUpView';
  static const kBottomNavigationBarView = '/BottomNavigationBarView';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kSignInView,
        builder: (BuildContext context, GoRouterState state) {
          return const SignInView();
        },
      ),
      GoRoute(
        path: kSignUpView,
        builder: (BuildContext context, GoRouterState state) {
          return const SignUpView();
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (BuildContext context, GoRouterState state) {
          return const ChatsView();
        },
      ),
      GoRoute(
        path: kBottomNavigationBarView,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
    ],
  );
}
