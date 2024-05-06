import 'package:flutter/material.dart';
import 'package:new_project/features/home/presentation/views/widgets/custom_friend_app_bar.dart';

class FriendsViewBody extends StatelessWidget {
  const FriendsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomFriendsAppBar(),
      ],
    );
  }
}
