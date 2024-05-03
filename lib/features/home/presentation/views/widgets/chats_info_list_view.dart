import 'package:flutter/material.dart';
import 'package:new_project/features/home/presentation/views/widgets/chat_info_button.dart';

class ChatsInfoListView extends StatelessWidget {
  const ChatsInfoListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return CustomChatInfoButton(onPressed: () {});
      },
    );
  }
}
