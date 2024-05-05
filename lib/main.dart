import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/utils/app_routes.dart';
import 'package:new_project/core/utils/colors_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:new_project/features/auth/data/repos/auth_repo_impl.dart';
import 'package:new_project/features/auth/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:new_project/features/home/data/repos/home_repo_impl.dart';
import 'package:new_project/features/home/presentation/manager/chats_cubit/chats_cubit.dart';
import 'package:new_project/features/home/presentation/manager/groups_cubit/groups_cubit.dart';
import 'package:new_project/simple_bloc_observer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();

  runApp(const ChatGramApp());
}

class ChatGramApp extends StatelessWidget {
  const ChatGramApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            AuthRepoImpl(),
          ),
        ),
        BlocProvider(
          create: (context) => ChatsCubit(
            HomeRepoImpl(),
          )..getChats(),
        ),
        BlocProvider(
          create: (context) => GroupsCubit(
            HomeRepoImpl(),
          )..getGroups(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRoutes.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: ColorAssetData.kScaffoldColor,
        ),
      ),
    );
  }
}
