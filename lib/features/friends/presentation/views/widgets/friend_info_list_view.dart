import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/models/person_model.dart';
import 'package:new_project/features/friends/presentation/manager/friends_cubit/friends_cubit.dart';
import 'package:new_project/features/friends/presentation/views/widgets/custom_friend_info_button.dart';

class FriendInfoListView extends StatelessWidget {
  const FriendInfoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FriendsCubit, FriendsState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        if (state is FriendsSuccess) {
          log(state.friends.length.toString());
          log('message from frirends list view');

          return ListView.builder(
            itemCount: state.friends.length,
            itemBuilder: (context, index) {
              return CustomFriendInfoButton(
                personModel: PersonModel(
                  email: state.friends[index].email,
                  name: state.friends[index].name,
                  image: state.friends[index].image,
                ),
                onPressed: () {},
              );
            },
          );
        } else if (state is FriendsFailuer) {
          return Text(state.errMessage);
        }
        //  else if (state is FriendsLoading) {
        //   return const Center(child: CircularProgressIndicator());
        // }
        else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
