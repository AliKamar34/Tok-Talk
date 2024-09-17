import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/features/chat/data/repos/chat_repo_impl.dart';
import 'package:new_project/features/chat/presentation/manager/private_chat_cubit/private_chat_cubit.dart';
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
