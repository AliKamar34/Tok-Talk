import 'package:flutter/material.dart';
import 'package:new_project/features/home/presentation/views/widgets/chats_view_body.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChatsViewBody(),
    );
  }
}
