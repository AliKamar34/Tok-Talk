import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_project/features/home/presentation/views/widgets/chat_info_button.dart';
import 'package:new_project/features/home/presentation/views/widgets/custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(),
        Expanded(
          child: ChatsInfoListView(),
        ),
      ],
    );
  }
}

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
