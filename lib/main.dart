import 'package:flutter/material.dart';
import 'package:new_project/core/utils/app_routes.dart';
import 'package:new_project/core/utils/colors_data.dart';

void main() {
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
