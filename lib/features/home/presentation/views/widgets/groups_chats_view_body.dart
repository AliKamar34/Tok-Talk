import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_project/features/home/data/models/person_model.dart';
import 'package:new_project/features/home/presentation/views/widgets/chat_info_button.dart';
import 'package:new_project/features/home/presentation/views/widgets/custom_group_app_bar.dart';

class GroupsChatsViewBody extends StatelessWidget {
  const GroupsChatsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomGrpoupsAppBar(),
        Expanded(child: GroupsListView()),
      ],
    );
  }
}

class GroupsListView extends StatelessWidget {
  const GroupsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return CustomChatInfoButton(
          onPressed: () {},
          personModel: PersonModel(
            email: 'ali@gmail.com',
            name: 'ali',
            image: 'https://en.m.wikipedia.org/wiki/File:Sample_User_Icon.png',
          ),
        );
      },
    );
  }
}
