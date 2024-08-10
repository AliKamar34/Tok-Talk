import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/features/friends/data/repos/friends_repo_impl.dart';
import 'package:new_project/features/friends/presentation/manager/friends_cubit/friends_cubit.dart';
import 'package:new_project/features/friends/presentation/views/widgets/friends_view_body.dart';

class FriendsView extends StatelessWidget {
  const FriendsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FriendsCubit(FriendsRepoImpl())..getFriends(),
      child: const Scaffold(
        body: FriendsViewBody(),
      ),
    );
  }
}
