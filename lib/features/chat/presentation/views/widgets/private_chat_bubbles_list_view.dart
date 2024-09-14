import 'package:flutter/material.dart';
import 'package:new_project/features/chat/presentation/views/widgets/private_chat_bubbels.dart';

class PrivateChatListViewMessages extends StatelessWidget {
  const PrivateChatListViewMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: ((context, index) {
          return const PrivateChatReseverBubbles(
            message: 'Added iMessage shape bubbles',
          );
        }));
  }
}
