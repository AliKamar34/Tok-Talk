import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:new_project/core/utils/app_routes.dart';
import 'package:new_project/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:new_project/features/home/presentation/views/widgets/groups_list_view.dart';

class GroupsChatsViewBody extends StatelessWidget {
  const GroupsChatsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: 'Groups',
          buttonTitle: 'New Group',
          onPressed: () {
            GoRouter.of(context).push(AppRoutes.kCreateGroupView);
          },
        ),
        const Expanded(child: GroupsListView()),
      ],
    );
  }
}
