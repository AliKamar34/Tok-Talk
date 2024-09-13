import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:new_project/features/auth/presentation/views/sign_in_view.dart';
import 'package:new_project/features/auth/presentation/views/sign_up_view.dart';
import 'package:new_project/features/chat/presentation/views/private_chat_view.dart';
import 'package:new_project/features/friends/data/repos/friends_repo_impl.dart';
import 'package:new_project/features/friends/presentation/manager/requests_cubit/requests_cubit.dart';
import 'package:new_project/features/friends/presentation/views/requests_view.dart';
import 'package:new_project/features/home/data/models/person_model.dart';
import 'package:new_project/features/home/presentation/views/home_view.dart';
import 'package:new_project/features/home/presentation/views/chats_view.dart';
import 'package:new_project/features/search/data/repos/search_repo_impl.dart';
import 'package:new_project/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:new_project/features/search/presentation/views/search_view.dart';
import 'package:new_project/features/settings/presentation/views/profile_view.dart';
import 'package:new_project/features/splash/presentation/views/splash_view.dart';

abstract class AppRoutes {
  static const kHomeView = '/homeView';
  static const kSignInView = '/signInView';
  static const kSignUpView = '/SignUpView';
  static const kSearchView = '/SearchView';
  static const kRequestsView = '/RequestsView';
  static const kProfileView = '/profileView';
  static const kPrivateChateView = '/privateChatView';

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
      GoRoute(
        path: kSearchView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => SearchCubit(SearchRepoImpl()),
            child: const SearchView(),
          );
        },
      ),
      GoRoute(
        path: kRequestsView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) =>
                RequestsCubit(FriendsRepoImpl())..getRequests(),
            child: const RequestsView(),
          );
        },
      ),
      GoRoute(
        path: kProfileView,
        builder: (BuildContext context, GoRouterState state) {
          return const ProfileView();
        },
      ),
        GoRoute(
        path: kPrivateChateView,
        builder: (BuildContext context, GoRouterState state) {
          return  PrivateChatView(
            personModel: state.extra as PersonModel,
          );
        },
      ),
    ],
  );
}
