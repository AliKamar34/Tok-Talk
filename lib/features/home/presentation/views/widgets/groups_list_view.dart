import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/features/home/data/models/person_model.dart';
import 'package:new_project/features/home/presentation/manager/groups_cubit/groups_cubit.dart';
import 'package:new_project/features/home/presentation/views/widgets/chat_info_button.dart';

class GroupsListView extends StatelessWidget {
  const GroupsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupsCubit, GroupsState>(
      builder: (context, state) {
        if (state is GroupsSuccess) {
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return CustomChatInfoButton(
                onPressed: () {},
                personModel: PersonModel(
                  email: 'ali@gmail.com',
                  name: 'ali',
                  image:
                      'https://en.m.wikipedia.org/wiki/File:Sample_User_Icon.png',
                ),
              );
            },
          );
        } else if (state is GroupsFailuer) {
          return Text(state.errMessage);
        } else if (state is GroupsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Text('initial state');
        }
      },
    );
  }
}
