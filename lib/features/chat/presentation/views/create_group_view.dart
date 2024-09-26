import 'package:flutter/material.dart';
import 'package:new_project/features/chat/presentation/views/widgets/create_group_view_body.dart';

class CreateGroupView extends StatelessWidget {
  const CreateGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:CreateGroupViewBody() ,
    );
  }
}
