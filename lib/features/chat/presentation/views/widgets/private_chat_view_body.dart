import 'package:flutter/material.dart';
import 'package:new_project/features/chat/presentation/views/widgets/private_caht_app_bar.dart';
import 'package:new_project/features/chat/presentation/views/widgets/private_chat_bubbles_list_view.dart';
import 'package:new_project/features/chat/presentation/views/widgets/private_chat_text_field.dart';
import 'package:new_project/features/home/data/models/person_model.dart';

class PrivateChatViewBody extends StatelessWidget {
  const PrivateChatViewBody({super.key, required this.personModel});
  final PersonModel personModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrivateChatAppBar(
          personModel: personModel,
        ),
        const Expanded(child: PrivateChatListViewMessages()),
        PrivateChatTextFeild(
          personModel: personModel,
        ),
      ],
    );
  }
}
