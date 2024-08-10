import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/features/home/data/models/person_model.dart';
import 'package:new_project/features/friends/presentation/manager/friends_cubit/friends_cubit.dart';
import 'package:new_project/features/friends/presentation/views/widgets/custom_friend_info_button.dart';

class FriendInfoListView extends StatelessWidget {
  const FriendInfoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendsCubit, FriendsState>(
      builder: (context, state) {
        if (state is FriendsSuccess) {
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return CustomFriendInfoButton(
                personModel: PersonModel(
                  email: 'ali@gmail.com',
                  name: 'ali',
                  image:
                      'https://en.m.wikipedia.org/wiki/File:Sample_User_Icon.png',
                ),
                onPressed: () {},
              );
            },
          );
        } else if (state is FriendsFailuer) {
          return Text(state.errMessage);
        } else if (state is FriendsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Text('initial state');
        }
      },
    );
  }
}
