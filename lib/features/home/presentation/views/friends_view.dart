import 'package:flutter/material.dart';
import 'package:new_project/features/home/presentation/views/widgets/friends_view_body.dart';

class FriendsView extends StatelessWidget {
  const FriendsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FriendsViewBody(),
    );
  }
}
