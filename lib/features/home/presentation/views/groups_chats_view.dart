import 'package:flutter/material.dart';
import 'package:new_project/features/home/presentation/views/widgets/groups_chats_view_body.dart';

class GroupsChatsView extends StatelessWidget {
  const GroupsChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:GroupsChatsViewBody() ,
    );
  }
}
