import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/models/person_model.dart';
import 'package:new_project/features/chat/presentation/manager/change_send_icon_cubit/change_send_icon_cubit.dart';
import 'package:new_project/features/chat/presentation/views/widgets/private_caht_app_bar.dart';
import 'package:new_project/features/chat/presentation/views/widgets/private_chat_bubbles_list_view.dart';
import 'package:new_project/features/chat/presentation/views/widgets/private_chat_text_field.dart';

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
        BlocProvider(
          create: (context) => ChangeSendIconCubit(),
          child: PrivateChatTextFeild(
            personModel: personModel,
          ),
        ),
      ],
    );
  }
}
