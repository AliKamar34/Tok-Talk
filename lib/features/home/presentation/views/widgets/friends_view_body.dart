import 'package:flutter/material.dart';
import 'package:new_project/features/home/data/models/person_model.dart';
import 'package:new_project/features/home/presentation/views/widgets/custom_friend_app_bar.dart';
import 'package:new_project/features/home/presentation/views/widgets/custom_friend_info_button.dart';

class FriendsViewBody extends StatelessWidget {
  const FriendsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomFriendsAppBar(),
        CustomFriendInfoButton(
          personModel: PersonModel(
            email: 'ali@gmail.com',
            name: 'ali',
            image: 'https://en.m.wikipedia.org/wiki/File:Sample_User_Icon.png',
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
