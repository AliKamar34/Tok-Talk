import 'package:flutter/material.dart';
import 'package:new_project/core/utils/app_routes.dart';
import 'package:new_project/core/utils/colors_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const ChatGramApp());
}

class ChatGramApp extends StatelessWidget {
  const ChatGramApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: ColorAssetData.kScaffoldColor,
      ),
    );
  }
}
