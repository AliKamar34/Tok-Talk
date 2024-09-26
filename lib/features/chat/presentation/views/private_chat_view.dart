import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/models/person_model.dart';
import 'package:new_project/features/chat/data/repos/chat_repo_impl.dart';
import 'package:new_project/features/chat/presentation/manager/private_chat_cubit/private_chat_cubit.dart';
import 'package:new_project/features/chat/presentation/views/widgets/private_chat_view_body.dart';

class PrivateChatView extends StatelessWidget {
  const PrivateChatView({super.key, required this.personModel});
  final PersonModel personModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => PrivateChatCubit(ChatRepoImpl())
            ..getMessages(receverEmail: personModel.email),
          child: PrivateChatViewBody(
            personModel: personModel,
          ),
        ),
      ),
    );
  }
}
