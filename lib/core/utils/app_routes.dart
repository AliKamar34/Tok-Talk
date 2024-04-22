
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:new_project/features/splash/presentation/views/splash_view.dart';

abstract class AppRoutes {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSerachView = '/searchView';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
     
      
    
    ],
  );
}
