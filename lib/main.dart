import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/utils/app_routes.dart';
import 'package:new_project/core/utils/colors_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:new_project/core/utils/contant.dart';
import 'package:new_project/features/auth/data/repos/auth_repo_impl.dart';
import 'package:new_project/features/auth/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:new_project/features/home/presentation/manager/chats_cubit/chats_cubit.dart';
import 'package:new_project/features/home/presentation/manager/groups_cubit/groups_cubit.dart';
import 'package:new_project/features/settings/data/models/enums/colors_enums.dart';
import 'package:new_project/features/settings/data/models/enums/theme_enums.dart';
import 'package:new_project/features/settings/presentation/manager/theme_cubit/theme_cubit.dart';
import 'package:new_project/simple_bloc_observer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPrefrence = await SharedPreferences.getInstance();
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
            
          )..getChats(),
        ),
        BlocProvider(
          create: (context) => GroupsCubit(
            
          )..getGroups(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit()..changeTheme(ThemeEnum.initial),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          if (state is ThemeDark) {
            return MaterialApp.router(
              routerConfig: AppRoutes.router,
              debugShowCheckedModeBanner: false,
              theme: ThemeData.dark().copyWith(
                scaffoldBackgroundColor: const Color(0xff161616),
              ),
            );
          } else if (state is ThemeLight) {
            return MaterialApp.router(
              routerConfig: AppRoutes.router,
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light().copyWith(
                scaffoldBackgroundColor:
                    colorAssetData(context, ColorEnum.scaffoldColor),
              ),
            );
          }
          return MaterialApp.router(
            routerConfig: AppRoutes.router,
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: const Color(0xff161616),
            ),
          );
        },
      ),
    );
  }
}
