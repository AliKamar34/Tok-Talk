import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_project/features/home/presentation/views/widgets/custom_friend_app_bar.dart';
import 'package:new_project/features/home/presentation/views/widgets/friend_info_list_view.dart';

class FriendsViewBody extends StatelessWidget {
  const FriendsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomFriendsAppBar(),
        Expanded(
          child: FriendInfoListView(),
        ),
      ],
    );
  }
}
