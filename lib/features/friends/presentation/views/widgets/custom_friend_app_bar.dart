import 'package:flutter/material.dart';
import 'package:new_project/features/friends/presentation/views/widgets/firend_box_action.dart';

class CustomFriendsAppBar extends StatelessWidget {
  const CustomFriendsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 48,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Friends',
              style: TextStyle(fontSize: 26),
            ),
            FriendBoxAction(),
          ],
        ),
      ),
    );
  }
}
