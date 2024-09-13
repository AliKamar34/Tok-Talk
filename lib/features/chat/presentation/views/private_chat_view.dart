import 'package:flutter/material.dart';
import 'package:new_project/features/chat/presentation/views/widgets/private_chat_view_body.dart';
import 'package:new_project/features/home/data/models/person_model.dart';

class PrivateChatView extends StatelessWidget {
  const PrivateChatView({super.key, required this.personModel});
  final PersonModel personModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PrivateChatViewBody(
          personModel: personModel,
        ),
      ),
    );
  }
}
